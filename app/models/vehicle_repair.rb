class VehicleRepair < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :service_center
  has_many :vehicle_repair_details, :dependent => :destroy
  
  after_create :update_vehicle_mileage, :if => :has_mileage_reading?
  before_save :update_amount_from_vehicle_details
  
  named_scope :this_year,  :conditions => ["invoice_date between ? and ?", Time.now.beginning_of_year.to_s(:db), Time.now.end_of_year.to_s(:db)]
  named_scope :this_month, :conditions => ["invoice_date between ? and ?", Time.now.beginning_of_month.to_s(:db), Time.now.end_of_month.to_s(:db)]
  named_scope :for_the_month, lambda { |month, year| { :conditions => ["invoice_date between ? and ?",Time.parse("1/1/#{year}").beginning_of_month, Time.parse("1/#{month}/#{year}").end_of_month] } }
  named_scope :for_the_year, lambda { |year| { :conditions => ["invoice_date between ? and ?",Time.parse("1/1/#{year}").beginning_of_month, Time.parse("1/#{month}/#{year}").end_of_month] } }


  accepts_nested_attributes_for :vehicle_repair_details
  
  delegate :name, :to => :service_center, :prefix => true, :allow_nil => true  
  def has_mileage_reading?
    !odometer_reading.blank? and !invoice_date.nil?
  end

  def update_vehicle_mileage
    vehicle.mileages.create(:reading => odometer_reading, :date_logged => invoice_date)
  end
  
  def repair_types(arr = [])
    vehicle_repair_details.each do |repair_detail|
      arr << repair_detail.repair_type_name
    end
    arr.uniq!
    return arr
  end
  
  def update_amount_from_vehicle_details
    self.amount = total_amount
  end
  
  def total_amount
    vehicle_repair_details.sum(:amount)
  end
  
end
