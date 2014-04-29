class CreateVehicleRepairDetails < ActiveRecord::Migration
  def self.up
    create_table :vehicle_repair_details do |t|
      t.belongs_to :vehicle_repair
      t.float :quantity
      t.string :item
      t.float :unit_price
      t.float :amount
      t.belongs_to :repair_type
      t.string :warranty

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_repair_details
  end
end
