class CreatePreventiveMaintenances < ActiveRecord::Migration
  def self.up
    create_table :preventive_maintenances do |t|
      t.belongs_to :vehicle
      t.belongs_to :service_center
      t.string :pms_milestone
      t.string :reference
      t.float :odometer_reading
      t.datetime :pms_date
      t.float :amount
      t.text :remarks
      t.timestamps
    end
  end

  def self.down
    drop_table :preventive_maintenances
  end
end
