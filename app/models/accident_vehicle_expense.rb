class AccidentVehicleExpense < ActiveRecord::Base
  belongs_to :service_center
  delegate :name, :to => :service_center, :prefix => true, :allow_nil => true
end
