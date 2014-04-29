class CreateCompanyTable < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :address
    end
    
  end

  def self.down
    drop_table :companies
  end
end
