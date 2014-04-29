class CreateInsuranceTable < ActiveRecord::Migration
  def self.up
    create_table :insurances do |t|
      t.belongs_to :vehicle
      t.string  :company
      t.string  :policy_number
      t.datetime :expiry_date
    end
  end

  def self.down
    drop_table :insurances
  end
end
