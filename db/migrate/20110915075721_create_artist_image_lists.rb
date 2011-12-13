class CreateArtistImageLists < ActiveRecord::Migration
  def self.up
    create_table :artist_image_lists do |t|
      t.string    :image_code,  :limit => 30
      t.integer   :price
      t.string    :file_name,   :limit => 30
      t.integer   :image_type_id
      t.integer   :artist_image_id
      t.boolean   :active,    :default => true     
      t.timestamps
    end
  end

  def self.down
    drop_table :artist_image_lists
  end
end
