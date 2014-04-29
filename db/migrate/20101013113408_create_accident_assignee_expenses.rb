class CreateAccidentAssigneeExpenses < ActiveRecord::Migration
  def self.up
    create_table :accident_assignee_expenses do |t|
      t.belongs_to :accident
      t.string :hospital
      t.float :repair_estimate
      t.string :paid_by
      t.text :remarks

      t.timestamps
    end
  end

  def self.down
    drop_table :accident_assignee_expenses
  end
end
