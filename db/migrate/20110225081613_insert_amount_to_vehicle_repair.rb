class InsertAmountToVehicleRepair < ActiveRecord::Migration
  def self.up
    add_column :vehicle_repairs, :amount, :float
  end

  def self.down
    remove_column :vehicle_repairs, :amount
  end
end
