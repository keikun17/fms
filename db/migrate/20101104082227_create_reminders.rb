class CreateReminders < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.integer :reminder_type_id 
      t.integer :parent_id
      t.string  :parent_type
      t.datetime :reminder_date
      t.timestamps
    end
  end

  def self.down
    drop_table :reminders
  end
end
