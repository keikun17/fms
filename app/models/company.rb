class Company < ActiveRecord::Base
  has_many :fleets, :class_name => "Fleet"
  has_many :vehicles, :through => :fleets, :source => :fleets_table_foreign_key_to_vehicles_table
  validates_presence_of :name
end
