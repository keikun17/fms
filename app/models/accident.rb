class Accident < ActiveRecord::Base
  belongs_to :service_center
  belongs_to :vehicle
  has_many :accident_assignee_expenses
  has_many :accident_vehicle_expenses
  
  accepts_nested_attributes_for :accident_assignee_expenses
  accepts_nested_attributes_for :accident_vehicle_expenses
  
  delegate :name, :to => :service_center, :prefix => true, :allow_nil => true
end
