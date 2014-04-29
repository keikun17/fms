class CreateAssignees < ActiveRecord::Migration
  def self.up
    create_table :assignees do |t|
      t.belongs_to :vehicle
      t.string :direct_line
      t.string :tel_no
      t.string :designation
      t.string :email
      t.string :mobile
      t.string :firstname
      t.string :surname

      t.timestamps
    end
  end

  def self.down
    drop_table :assignees
  end
end
