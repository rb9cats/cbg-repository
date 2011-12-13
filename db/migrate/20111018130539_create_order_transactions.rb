class CreateOrderTransactions < ActiveRecord::Migration
  def self.up
    create_table :order_transactions do |t|
      t.integer :order_id
      t.string  :image_type
      t.integer :artist_id
      t.timestamps
    end
  end

  def self.down
    drop_table :order_transactions
  end
end
