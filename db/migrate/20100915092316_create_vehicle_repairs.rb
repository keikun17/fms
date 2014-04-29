class CreateVehicleRepairs < ActiveRecord::Migration
  def self.up
    create_table :vehicle_repairs do |t|
      t.datetime :invoice_date
      t.float :odometer_reading
      t.text :repairs_performed
      t.float :subtotal
      t.belongs_to :repair_type
      t.belongs_to :vehicle
      t.timestamps
    end
  end

  def self.down
    drop_table :vehicle_repairs
  end
end
