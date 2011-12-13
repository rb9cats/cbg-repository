class ArtistImage < ActiveRecord::Base
  belongs_to :artist
  has_many :artist_image_lists, :dependent => :destroy
  #validates_presence_of :name

  def before_destroy
    path_to_remove = ARTIST_AVATAR_ROOT + "#{self.id}/"
    FileUtils.rm_rf(path_to_remove)
  end

  def delete_artist_img
    path_to_remove = ARTIST_AVATAR_ROOT + "#{self.id}/"
    FileUtils.rm_rf(path_to_remove)
  end

  

  
 def upload_photo(file,type_id)    
    valid = 0
    file_name = file.original_filename
    file_name = sanitize_filename(file_name)
    img_types = USER_PHOTO_TYPES.clone
    img_types.each do |ext|
      if ( file_name.ends_with?(ext) || file_name.ends_with?(ext.upcase))
        valid = 1
        break
      end
    end
    return false if valid != 1  # Invalid File Type
    path_to_save = ARTIST_AVATAR_ROOT + "#{self.id}/"
    FileUtils.mkdir_p(path_to_save) if !File.directory?(path_to_save)
    path = File.join(path_to_save, file_name)
    File.open(path, "wb") { |f| f.write(file.read) }
    if File.exists?(path)
      make_smallthumbnail(path,100,100,150,150) if type_id = "Small"
      make_mediumthumbnail(path,100,100,200,200)if type_id = "Medium"
      make_largethumbnail(path,100,100,300,300) if type_id = "Large"

    end
  end

  def make_smallthumbnail(img_path,width,height,thumb_width,thumb_height)
    begin
      ext = File.extname(img_path)
      resize_images(img_path,width,height)
      img = ImageList.new(img_path)

        thumb_image = img.change_geometry!(Geometry.new(thumb_width, thumb_height)){ |cols, rows, img|
          img.resize_to_fit(thumb_width, thumb_height)
        }
        thumb_image.write(File.dirname(img_path)+"/"+File.basename(img_path, ext)+"_small"+ ext)

    rescue
    end
  end

  def make_mediumthumbnail(img_path,width,height,thumb_width,thumb_height)
    begin
      ext = File.extname(img_path)
      resize_images(img_path,width,height)
      img = ImageList.new(img_path)

        thumb_image = img.change_geometry!(Geometry.new(thumb_width, thumb_height)){ |cols, rows, img|
          img.resize_to_fit(thumb_width, thumb_height)
        }
        thumb_image.write(File.dirname(img_path)+"/"+File.basename(img_path, ext)+"_medium"+ ext)

    rescue
    end
  end


  def make_largethumbnail(img_path,width,height,thumb_width,thumb_height)
    begin
      ext = File.extname(img_path)
      resize_images(img_path,width,height)
      img = ImageList.new(img_path)

        thumb_image = img.change_geometry!(Geometry.new(thumb_width, thumb_height)){ |cols, rows, img|
          img.resize_to_fit(thumb_width, thumb_height)
        }
        thumb_image.write(File.dirname(img_path)+"/"+File.basename(img_path, ext)+"_large"+ ext)

    rescue
    end
  end

  def resize_images(img_path,width,height)
    begin
      ext = File.extname(img_path)
      if USER_PHOTO_TYPES.include?(ext) || USER_PHOTO_TYPES.include?(ext.downcase)
        # Resize the image.
        img = ImageList.new(img_path)
        if (img.columns >= width || img.rows >= height)
          new_img = img.resize_to_fit(width,height)
        else
          new_img = img
        end
        new_img.write(img_path)
      else
      end
    rescue
    end
  end

  def sanitize_filename(filename)
    filename=filename.downcase
    filename = File.basename(filename.gsub("\\", "/")) # work-around for IE
    filename.gsub!(/[^a-zA-Z0-9\.\-\+_]/,"_")
    filename = "_#{filename}" if filename =~ /^\.+$/
    filename = "unnamed" if filename.size == 0
    return filename
  end
  
end
