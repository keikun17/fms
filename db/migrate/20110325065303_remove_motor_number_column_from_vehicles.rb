class RemoveMotorNumberColumnFromVehicles < ActiveRecord::Migration
  def self.up
    remove_column :vehicles, :motor_number
  end

  def self.down
    add_column :vehicle, :motor_number, :string
  end
end
