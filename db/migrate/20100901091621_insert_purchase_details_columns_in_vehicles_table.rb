class InsertPurchaseDetailsColumnsInVehiclesTable < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :purchase_date, :date
    add_column :vehicles, :purchase_amount, :float
    add_column :vehicles, :car_dealer, :string
    add_column :vehicles, :sales_executive, :string
  end

  def self.down
    remove_column :vehicles, :purchase_date
    remove_column :vehicles, :purchase_amount
    remove_column :vehicles, :car_dealer
    remove_column :vehicles, :sales_executive
  end
end
