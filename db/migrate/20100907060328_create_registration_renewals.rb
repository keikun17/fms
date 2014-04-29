class CreateRegistrationRenewals < ActiveRecord::Migration
  def self.up
    create_table :registration_renewals do |t|
      t.date :renewal_date
      t.string :registration_office
      t.float :amount_paid
      t.belongs_to :vehicle

      t.timestamps
    end
  end

  def self.down
    drop_table :registration_renewals
  end
end
