class AddFuelTypeIdToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :fuel_type_id, :integer
  end

  def self.down
    remove_column :vehicles, :fuel_type_id
  end
end
