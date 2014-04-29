class CreateAccidentVehicleExpenses < ActiveRecord::Migration
  def self.up
    create_table :accident_vehicle_expenses do |t|
      t.belongs_to :accident
      t.belongs_to :service_center
      t.float :repair_estimate
      t.string :paid_by
      t.text :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :accident_vehicle_expenses
  end
end
