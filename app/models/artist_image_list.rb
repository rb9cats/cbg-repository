class ArtistImageList < ActiveRecord::Base
  belongs_to :artist_image
  belongs_to :image_type  
  #validates_presence_of :price
  #validates_format_of :price, :numericality => true

  def artist_photo_small
    if !self.file_name.blank?
      "/artist_avatars/#{self.artist_image_id}/" + artist_photo_thumb
    end
  end

  def artist_photo_thumb
    ext = File.extname(self.file_name)
    path =  "/artist_avatars/" + "#{self.artist_image_id}/"
    thumb_file_name = File.basename(self.file_name, ext) +"_small"+ ext
  end

  

  def artist_photo_medium
    if !self.file_name.blank?
      "/artist_avatars/#{self.artist_image_id}/" + artist_photo_medium_thumb
    end
  end

  def artist_photo_medium_thumb
    ext = File.extname(self.file_name)
    path =  "/artist_avatars/" + "#{self.artist_image_id}/"
    thumb_file_name = File.basename(self.file_name, ext) +"_medium"+ ext
  end


  def artist_photo_large
    if !self.file_name.blank?
      "/artist_avatars/#{self.artist_image_id}/" + artist_photo_large_thumb
    end
  end

  def artist_photo_large_thumb
    ext = File.extname(self.file_name)
    path =  "/artist_avatars/" + "#{self.artist_image_id}/"
    thumb_file_name = File.basename(self.file_name, ext) +"_large"+ ext
  end

  
end
