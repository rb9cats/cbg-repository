require 'RMagick'
include Magick
class Artist < ActiveRecord::Base  
  has_many :orders
  has_many :order_transactions
  has_many :artist_images , :dependent => :destroy
  validates_presence_of :name
  

  def before_destroy
      path_to_remove = ARTIST_AVATAR_ROOT + "#{self.id}/"
      FileUtils.rm_rf(path_to_remove)
  end

  
  
end
