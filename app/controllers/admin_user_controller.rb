class AdminUserController < ApplicationController
  before_filter :admin_check_session, :except => [:index , :login]
  layout "application"
  
  def index
    if session[:admin_user_id]
      redirect_to :controller=>"artist",:action => 'main'
    end
  end 

  def dashboard
    @admin = Administrator.find_by_id(session[:admin_user_id])
  end
  
  def transaction
    @orders = Order.find(:all)
  end

  def login
    if request.post?
      login_email = params[:administrator][:email]
      session[:email] = login_email
      login_password = params[:administrator][:password]
      if login_email.blank? || login_password.blank?
        flash.now[:messgae] = "You must enter an Username and Password"
        render :action => "index"
      else
        user = Administrator.authenticate(login_email,login_password)
        if user and user.active?
          @user = Administrator.find_by_email(session[:email])
          session[:admin_user_id] = @user.id
          session[:admin_username]= @user.username
          redirect_to :action => "dashboard",:controller => "admin_user"
        else
          flash.now[:messgae] = "Username and Password is Wrong"
          render :action => "index"
        end
      end
    else
      redirect_to :action => "index"
    end
  end

  


  def member_index
    @user_list = User.all.paginate :page => params[:page], :per_page => 10
  end

  def artists_index
    @artists = Artist.all.paginate :page => params[:page], :per_page => 10
  end

  
  
  def edit_member    
    @user = User.find(params[:id])
    if request.post?
      if @user.update_attributes(params[:user])
        if !params[:password].blank?
        @user.password = @user.enc_pass(params[:password])
        end
        @user.save
        redirect_to :action => "member_index"      
      end
    end
  end

  def edit_artist
    @artist = Artist.find(params[:id])
    art_imgs = ArtistImage.find(:all,:select =>"id",:conditions=>["artist_id = ?",@artist.id])
    @artist_imgs = ArtistImageList.find(:all,:conditions=>["artist_image_id in (?) and image_type_id = ?",art_imgs,2]).paginate(:page => params[:page])
    if request.post?
      if @artist.update_attributes(params[:artist])
        @artist.save
        redirect_to :action => "artists_index"
      else
        flash.now[:error] = 'Please fill the fields'
        render :action => "edit_artist"
      end
    end
  end

  def edit_image
    @artist_image = ArtistImage.find(params[:id])
    
    @artist_edit_imgs  = ArtistImageList.find_all_by_artist_image_id(@artist_image.id)

    @artist_image_list = ArtistImageList.new
    return if request.get?

    if !@artist_edit_imgs.blank?
      @artist_edit_imgs.each do |d|
        d.destroy
      end
    end
    @artist_image.delete_artist_img
    file_type_invalid = false
    file_blank = false
    price_value = false
    price = params[:artist_image_list][:price].each {|p| p}
    type = ["Small","Medium","Large"]
    if !params[:artist_image_list][:file_name].blank?
      album_photos = params[:artist_image_list][:file_name].each {|p| p}
      album_photos = album_photos.zip(price,type)
    end
    if album_photos and album_photos.size == 3
      album_photos.each do |photo,price,type_id|
        if !photo.blank? and !price.blank?
          uploaded = @artist_image.upload_photo(photo,type_id)
          if uploaded
            @artist_image.update_attributes(params[:artist_image])
            @artist_image.save
            @artist_image_list = ArtistImageList.new(params[:artist_image_list])
            @artist_image_list.price =  price
            file_name = photo.original_filename
            file_name = @artist_image.sanitize_filename(file_name)
            @image_type_id = ImageTypeList.find_by_name(type_id)
            @artist_image_list.image_code = rand(1000)
            @artist_image_list.image_type_id = @image_type_id.id
            @artist_image_list.artist_image_id = @artist_image.id
            @artist_image_list.file_name = file_name
            @artist_image_list.save
          end
          if !uploaded
            file_type_invalid = true
          end
        else
          price_value = true
          file_blank = true
        end
      end
    end
    if !file_type_invalid && !file_blank
      flash[:messgae] ='Artist Images Uploaded'
      redirect_to :action => "edit_artist" , :id => @artist_image.artist_id
      return
    else
      flash.now[:messgae] = "Photos not uploaded. Please check the file type" if file_type_invalid
      flash.now[:messgae] = "Photos not uploaded. Please Give All Price Values" if price_value
      return
    end
  end
  
  

  def delete_member
    @user = User.find(params[:id])
    if User.destroy(@user.id)
      flash.now[:messgae] = "#{@user.first_name} is Deleted"
      redirect_to :action => "member_index"
    end
  end

  def delete_artist
    @artist = Artist.find(params[:id])
    if Artist.destroy(@artist.id)
      flash.now[:messgae] = "#{@artist.name} is Deleted"
      redirect_to :action => "artists_index"
    end
  end

  def create_artist
    @artist = Artist.new(params[:artist])
    if request.post?
      if @artist.save
        redirect_to :action => 'add_photos', :artist_id => @artist.id
        return
      end
    end
  end
  
  def add_photos
    @artist = Artist.find(params[:artist_id])
    @artist_image_list = ArtistImageList.new
    return if request.get?
    file_type_invalid = false
    file_blank = false
    price_value = false
    price = params[:artist_image_list][:price].each {|p| p}
    type = ["Small","Medium","Large"]
    if !params[:artist_image_list][:file_name].blank?
      album_photos = params[:artist_image_list][:file_name].each {|p| p}
      album_photos = album_photos.zip(price,type)
      
    end
    if album_photos and album_photos.size == 3
      @artist_image = ArtistImage.new(params[:artist_image])
      @artist_image.artist_id = params[:artist_id]
      if @artist_image.save
        album_photos.each do |photo,price,type_id|
          if !photo.blank? and !price.blank?
            uploaded = @artist_image.upload_photo(photo,type_id)
            if uploaded
              @artist_image_list = ArtistImageList.new(params[:artist_image_list])
              @artist_image_list.price =  price
              file_name = photo.original_filename
              file_name = @artist_image.sanitize_filename(file_name)
              @image_type_id = ImageTypeList.find_by_name(type_id)
              @artist_image_list.image_code = rand(1000)
              @artist_image_list.image_type_id = @image_type_id.id
              @artist_image_list.artist_image_id = @artist_image.id
              @artist_image_list.file_name = file_name
              @artist_image_list.save
            end
            if !uploaded
              file_type_invalid = true
            end
          else
            price_value = true
            file_blank = true
          end
        end
      end
      if !file_type_invalid && !file_blank
        flash[:messgae] ='Artist Images Uploaded'
        redirect_to :action => "edit_artist" , :id => @artist.id
        return
      else
        flash.now[:messgae] = "Photos not uploaded. Please check the file type" if file_type_invalid
        flash.now[:messgae] = "Photos not uploaded. Please Give All Price Values" if price_value
        return
      end
    else
      flash.now[:messgae] = "Please Upload All the images and all Prices"
    end
  end
  
  def logout
    reset_session
    redirect_to :action => "index"
  end
end
