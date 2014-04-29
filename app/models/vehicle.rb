class Vehicle < ActiveRecord::Base
  STATES = ["active","inactive","others"]
  ACTIVE  = "active"

  cattr_reader :per_page
  @@per_page = 10

  validates_presence_of :year, :make, :model, :plate_number, :purchase_date
  validates_numericality_of :year, :allow_nil => true
  validates_presence_of :fleet
  validates_presence_of :pms_interval
  
  
  scope :inactive, lambda{ where("state != ?", ACTIVE)}
  scope :active, lambda{where("state = ?", ACTIVE)}

  after_create :initialize_mileage
  
  before_update :update_reminders

  validates :purchase_date, :presence => true
  
  has_many :insurances, :dependent => :destroy
  accepts_nested_attributes_for :insurances
  
  has_many :reminders, :as => :parent, :dependent => :destroy

  #END PMS REMINDER COMPUTATION

  belongs_to :fleet, :class_name => "Fleet", :foreign_key => "fleet_id"
  has_many :accidents, :dependent => :destroy
  has_many :assignees, :dependent => :destroy
  has_many :batteries, :dependent => :destroy do 
      
    def expense_per_km
      return 0 if empty? or first.vehicle.mileages.last(:conditions => "reading is not null").nil?
      sum(:amount) / first.vehicle.mileages.last.reading
    end
    
    def expenses_for_the_month(month,year)
      start_date = Time.parse("1/#{month}/#{year}").beginning_of_month
      end_date = Time.parse("1/#{month}/#{year}").end_of_month
      results = find(:all, :conditions => ["replacement_date between ? and ?",start_date, end_date])
      results.empty? ? 0 : results.collect{|result| result.amount}.sum
    end
  end

  has_many :mileages, :dependent => :destroy, :order => "date_logged asc", :conditions => "reading > 0" do 
    def average
       (find(:first).date_logged  - find(:last).date_logged)
    end
  end

  has_many :preventive_maintenances, :dependent => :destroy, :order => "pms_date asc" do
    def expenses_for_the_month(month,year)
      start_date = Time.parse("1/#{month}/#{year}").beginning_of_month
      end_date = Time.parse("1/#{month}/#{year}").end_of_month
      results = find(:all, :conditions => ["pms_date between ? and ?",start_date, end_date])
      results.empty? ? 0 : results.collect{|result| result.amount}.sum
    end
  end

  has_many :registration_renewals, :dependent => :destroy

  has_many :tires, :dependent => :destroy do
    def expense_per_km
      return 0 if empty? or first.vehicle.mileages.last(:conditions => "reading is not null").nil?
      sum(:amount) / first.vehicle.mileages.last.reading
    end
    
    def expenses_for_the_month(month,year)
      start_date = Time.parse("1/#{month}/#{year}").beginning_of_month
      end_date = Time.parse("1/#{month}/#{year}").end_of_month
      results = find(:all, :conditions => ["replacement_date between ? and ?",start_date, end_date])
      results.empty? ? 0 : results.collect{|result| result.amount}.sum
    end
  end

  belongs_to :fuel_type, :dependent => :destroy

  has_many :vehicle_repairs, :dependent => :destroy
  has_many :vehicle_repair_details, :through => :vehicle_repairs
    
  delegate :designation, :to => :assignee, :prefix => true, :allow_nil => true
  delegate :name, :to => :fuel_type, :prefix => true, :allow_nil => true

  def assignee
    assignees.first
  end
  
  def initialize_mileage
    mileages.create(:date_logged => purchase_date, :reading => 0)
  end
  
  #PMS REMINDER COMPUTATION
  def update_reminders
    self.reminders.destroy_all
    create_pms_reminder
    create_vehicle_registration_reminder
    create_insurance_reminder
  end
  
  def create_insurance_reminder
    return nil if insurances.empty? or insurances.first.expiry_date.blank?
    reminders.create(:reminder_type_id => Reminder::REMINDER_TYPES[:vehicle_insurance], :reminder_date => insurances.last.expiry_date)
  end
  
  def create_vehicle_registration_reminder
    return nil if invalid_plate? or registration_expiration_date.nil?
    reminders.create(:reminder_type_id => Reminder::REMINDER_TYPES[:vehicle_registration], :reminder_date => registration_expiration_date)
  end
  
  def last_registration_date
   if registration_renewals.empty?
     return purchase_date
   else
     return registration_renewals.last.renewal_date
   end
  end
  
  def registration_expiration_date
    return nil if invalid_plate?
    numbers_in_plate = plate_number.scan(/[0-9]/)  
    r_year = last_registration_date.year + (registration_renewals.empty? ? 3 : 1)
    r_month = numbers_in_plate[2].eql?("0") ? "10" : "0" + numbers_in_plate[2]
    #TODO : drill down to exact day
    Date.parse("#{01}/#{r_month}/#{r_year}")

  end
  
  def invalid_plate?
    return true if plate_number.blank?
    numbers_in_plate = plate_number.scan(/[0-9]/)
    numbers_in_plate.size != 3
  end
    
  def create_pms_reminder
    return nil if average_mileage.eql?(0.0)
    estimated_days_from_last_pms_to_pms_date = (self.pms_interval)/average_mileage
    date_of_next_pms =last_pms_date.advance(:days => estimated_days_from_last_pms_to_pms_date)
    reminders.create(:reminder_type_id => Reminder::REMINDER_TYPES[:pms], :reminder_date => date_of_next_pms)
  end

  def days_since_last_pms
    days_since_last_pms = ((((Time.now - last_pms_date)/60)/60))/24
  end

  def last_pms_date
    return_value = preventive_maintenances.last.nil? ? purchase_date : preventive_maintenances.last.pms_date
    return return_value.to_time
  end

  def last_pms_reading
    return_value = preventive_maintenances.last.nil? ? 0.to_f : preventive_maintenances.last.odometer_reading
    return return_value
  end

  def mileage_date_difference(format = :days)
    in_seconds = mileages.empty? ? 0 : (mileages.last.date_logged - mileages.first.date_logged)
    return case format
    when :seconds
      in_seconds
    when :minutes
      (in_seconds)/60
    when :hours
      ((in_seconds)/60)/60
    when :days
      (((in_seconds)/60)/60/24)
    end
  end
  
  def mileage_reading_difference
    return mileages.empty? ? 0 : (mileages.last.reading - mileages.first.reading)
  end

  def average_mileage(format = :days, precision = 2)
    reading_difference = mileage_reading_difference
    date_difference = mileage_date_difference(format)
    average_reading = (reading_difference.zero? && date_difference.zero?) ? 0 : ( reading_difference / date_difference )
    return average_reading.round(2)
  end

  def estimated_mileage_today
    return 0.round(2) if mileages.empty?
    reading = mileages.last.reading + (average_mileage * days_since_last_mileage_reading)
    return reading.round(2)
  end
  
  def days_since_last_mileage_reading
    (((Time.now - mileages.last.date_logged)/60)/60)/24
  end
  
  def complete_model
    [self.year, self.make, self.model].join(' ')
  end
  
  def repair_expense_per_km
    return 0 if mileages.last(:conditions => "reading is not null").nil? or vehicle_repairs.empty?
    vehicle_repair_details.sum(:amount) / mileages.last.reading
  end
  
  def total_repair_expenses_for_year(year)
    start_date = Time.parse("1/1/#{year}")
    end_date  = start_date.end_of_year
    vehicle_repair_details.sum(:amount, :include => [:vehicle_repair], :conditions =>["vehicle_repairs.invoice_date between ? and ?", start_date, end_date])
  end
  
  def total_repair_expenses_for_month(month, year)
    start_date = Time.parse("1/#{month}/#{year}")
    end_date = start_date.end_of_month
    vehicle_repair_details.sum(:amount, :include => [:vehicle_repair], :conditions =>["vehicle_repairs.invoice_date between ? and ?", start_date, end_date])
  end
  
  def total_pms_expenses
    preventive_maintenances.sum(:amount)
  end
  
  def pms_expenses_for_year(year)
    start_date = Date.parse("01-01-#{year}").to_s(:db)
    end_date = Date.parse("01-01-#{year}").end_of_year.to_s(:db)
    pms_expense = preventive_maintenances.find(:all, :conditions => ["pms_date >= ? and pms_date <= ?", start_date, end_date]).map{|x| x.amount}.sum
    return pms_expense
  end
  
  def pms_expense_per_km
    return 0 if mileages.last(:conditions => "reading is not null").nil?
    total_pms_expenses / mileages.last.reading
  end
  
  def expense_for_the_month(month, year)
    total = preventive_maintenances.expenses_for_the_month(month,year) + total_repair_expenses_for_month(month, year) + batteries.expenses_for_the_month(month, year) + tires.expenses_for_the_month(month, year)
  end
        
end
