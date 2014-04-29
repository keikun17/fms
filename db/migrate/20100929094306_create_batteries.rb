class CreateBatteries < ActiveRecord::Migration
  def self.up
    create_table :batteries do |t|
      t.belongs_to :vehicle
      t.datetime :replacement_date
      t.float :odometer_reading
      t.string :brand
      t.string :model
      t.string :size
      t.string :supplier
      t.float :amount
      t.text :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :batteries
  end
end
