class DeviseCreateFleetUsers < ActiveRecord::Migration
  def self.up
    create_table(:fleet_users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :fleet_users, :email,                :unique => true
    add_index :fleet_users, :reset_password_token, :unique => true
    # add_index :fleet_users, :confirmation_token,   :unique => true
    # add_index :fleet_users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :fleet_users
  end
end
