class CreateArtistImages < ActiveRecord::Migration
  def self.up
    create_table :artist_images do |t|
      t.string    :name,       :limit => 30,      :null => false
      t.text      :description,:limit => 30,   :null => false
      t.integer   :artist_id
      t.boolean    :active,    :default => true      
      t.timestamps
    end
  end

  def self.down
    drop_table :artist_images
  end
end
