class CreateServiceCenters < ActiveRecord::Migration
  def self.up
    create_table :service_centers do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end

  def self.down
    drop_table :service_centers
  end
end
