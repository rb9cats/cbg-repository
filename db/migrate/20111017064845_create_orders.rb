class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.string  :card_expires_on
      t.string  :transaction_id
      t.integer :artist_id
      t.string  :artist_image_name
      t.integer :user_id
      t.decimal :total_price
      t.boolean :success , :default => false
      t.timestamps

    end
  end

  def self.down
    drop_table :orders
  end
end
