class Fleet < ActiveRecord::Base
  belongs_to :company, :class_name => "Company", :foreign_key => "company_id"
  has_many :vehicles
  validates_presence_of :name
  has_many :reminders, :through => :vehicles

  # validates_presence_of :company
end
