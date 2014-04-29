class InsertMiscColumnsToVehicles < ActiveRecord::Migration
  def self.up
    
    add_column :vehicles, :division, :string
    add_column :vehicles, :area, :string
    add_column :vehicles, :engine_number, :string
  end

  def self.down
    remove_column :vehicles, :division
    remove_column :vehicles, :area
    remove_column :vehicles, :engine_number
  end
end
