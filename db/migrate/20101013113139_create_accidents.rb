class CreateAccidents < ActiveRecord::Migration
  def self.up
    create_table :accidents do |t|
      t.datetime :accident_date
      t.string :location
      t.text :description
      t.string :reference
      t.belongs_to :service_center
      t.float :repair_estimate
      t.float :deductible
      t.text :remarks
      t.belongs_to :vehicle

      t.timestamps
    end
  end

  def self.down
    drop_table :accidents
  end
end
