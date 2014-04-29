class Assignee < ActiveRecord::Base
  belongs_to :vehicle
  
  def fullname
    [firstname, surname].join(" ")
  end
  
end
