class CreateImageTypeLists < ActiveRecord::Migration
  def self.up
    create_table :image_type_lists do |t|
      t.string    :name,       :limit => 30      
      t.text      :description,   :limit => 30
      t.timestamps
    end
  end

  def self.down
    drop_table :image_type_lists
  end
end
