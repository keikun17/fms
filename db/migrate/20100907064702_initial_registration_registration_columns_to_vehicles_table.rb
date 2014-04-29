class InitialRegistrationRegistrationColumnsToVehiclesTable < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :registered_owner, :string
    add_column :vehicles, :initial_registration_office, :string
    add_column :vehicles, :registration_mv_file_number, :string
  end

  def self.down
    remove_column :vehicles, :registered_owner
    remove_column :vehicles, :initial_registration_office
    remove_column :vehicles, :registration_mv_file_number
  end
end
