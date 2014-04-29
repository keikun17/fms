class AccidentAssigneeExpense < ActiveRecord::Base
  belongs_to :service_center
  belongs_to :accident
end
