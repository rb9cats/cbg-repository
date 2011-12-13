class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string    :name,       :limit => 30, :null => false
      t.text      :description,   :limit => 30
      t.boolean    :active,    :default => true          
      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
