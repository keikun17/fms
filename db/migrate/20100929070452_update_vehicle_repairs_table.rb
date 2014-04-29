class UpdateVehicleRepairsTable < ActiveRecord::Migration
  def self.up
    remove_column :vehicle_repairs, :repair_type_id
    remove_column :vehicle_repairs, :repairs_performed
    add_column    :vehicle_repairs, :service_center_id, :integer
    add_column    :vehicle_repairs, :reference_number, :string
    add_column    :vehicle_repairs, :remarks, :text
    add_index     :vehicle_repairs, :service_center_id
  end

  def self.down
    add_column :vehicle_repairs, :repair_type_id, :integer
    add_column :vehicle_repairs, :repairs_performed, :text
    remove_column :vehicle_repairs, :service_center_id
    remove_column :vehicle_repairs, :reference_number
    remove_column :vehicle_repairs, :remarks
  end
end
