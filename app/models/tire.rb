class Tire < ActiveRecord::Base
  belongs_to :vehicle
  
  after_create :update_vehicle_mileage, :if => :has_mileage_reading?
  named_scope :this_year,  :conditions => ["replacement_date between ? and ?", Time.now.beginning_of_year.to_s(:db), Time.now.end_of_year.to_s(:db)]
  named_scope :this_month, :conditions => ["replacement_date between ? and ?", Time.now.beginning_of_month.to_s(:db), Time.now.end_of_month.to_s(:db)]

   def has_mileage_reading?
     !odometer_reading.blank? and !replacement_date.nil?
   end

   def update_vehicle_mileage
     vehicle.mileages.create(:reading => odometer_reading, :date_logged => replacement_date)
   end
   
end
