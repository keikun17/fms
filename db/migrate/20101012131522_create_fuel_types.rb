class CreateFuelTypes < ActiveRecord::Migration
  def self.up
    create_table :fuel_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :fuel_types
  end
end
