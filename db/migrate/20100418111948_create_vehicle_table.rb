class CreateVehicleTable < ActiveRecord::Migration
  def self.up
    create_table :vehicles, :force => true do |t|
      t.string :name
      t.integer :year
      t.string :make
      t.string :model
      t.string :plate_number
      t.string :conduction_sticker_number
      t.string :color
      t.string :transmission_type
      t.string :chassis_number
      t.string :motor_number
      t.string :state
      t.belongs_to :fleet
      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
