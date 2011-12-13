class CreateAdministrators < ActiveRecord::Migration
  def self.up
    create_table :administrators do |t|
      t.string    :first_name, :limit => 30,      :null => false
      t.string    :last_name,  :limit => 30,      :null => false
      t.string    :email,      :limit => 255,     :null => false,   :unique => true
      t.string    :username,   :limit => 30,      :null => false,   :unique => true
      t.string    :password,   :limit => 50,      :null => false
      t.boolean    :active,    :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :administrators
  end
end
