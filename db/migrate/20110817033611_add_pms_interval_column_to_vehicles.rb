class AddPmsIntervalColumnToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :pms_interval, :integer, :default => 5000
  end

  def self.down
    remove_column :vehicles, :pms_interval
  end
end
