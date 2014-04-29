class DeviseCreateCompanyUsers < ActiveRecord::Migration
  def self.up
    create_table(:company_users) do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.datetime :birth_date
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps
    end

    add_index :company_users, :email,                :unique => true
    add_index :company_users, :reset_password_token, :unique => true
    # add_index :company_users, :confirmation_token,   :unique => true
    # add_index :company_users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :company_users
  end
end
