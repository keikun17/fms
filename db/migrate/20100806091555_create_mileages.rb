class CreateMileages < ActiveRecord::Migration
  def self.up
    create_table :mileages do |t|
      t.datetime :date_logged
      t.float :reading
      t.belongs_to :vehicle
      t.timestamps
    end
  end

  def self.down
    drop_table :mileages
  end
end
