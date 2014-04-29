class CreateTires < ActiveRecord::Migration
  def self.up
    create_table :tires do |t|
      t.belongs_to :vehicle
      t.datetime :replacement_date
      t.float :odometer_reading
      t.string :brand
      t.string :model
      t.string :size
      t.string :supplier
      t.float :unit_price
      t.integer :quantity
      t.float :parts_expense
      t.float :labor_expense
      t.float :amount
      t.text :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :tires
  end
end
