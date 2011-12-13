class ArtistController < ApplicationController

  def main
    images = ArtistImage.find(:all, :select => "id",:group=>"artist_id")
    @lists = ArtistImageList.find(:all,:conditions=>["artist_image_id in (?) and image_type_id = ?",images,2]).paginate :page => params[:page], :per_page => 10
  end

  def artist_photos
    @artist_photo = Artist.find(params[:id])
    art_imgs = ArtistImage.find(:all,:select =>"id",:conditions=>["artist_id = ?",@artist_photo.id])
    @artist_imgs = ArtistImageList.find(:all,:conditions=>["artist_image_id in (?) and image_type_id = ?",art_imgs,2]).paginate(:page => params[:page])
  end

  def artist_size_photos
    @artist_photo = ArtistImage.find(params[:id])   
    @artist_all_img1 = ArtistImageList.find_by_artist_image_id_and_image_type_id(@artist_photo.id,1)
    @artist_all_img2 = ArtistImageList.find_by_artist_image_id_and_image_type_id(@artist_photo.id,2)
    @artist_all_img3 = ArtistImageList.find_by_artist_image_id_and_image_type_id(@artist_photo.id,3)    
  end

  def transaction
    
    if session[:user_id] 
      @artist_img = ArtistImage.find_by_id(params[:id])
      if !params[:small_image].blank? or  params[:medium_image] or  params[:large_image]

        @small = params[:small_image]

        

        @medium = params[:medium_image]

        

        @large = params[:large_image]

        
      else
        redirect_to :controller =>"artist",:action =>"artist_size_photos",:id =>@artist_img.id
        flash[:message] = "Please select atleast one image"
      end

      @total = 0

      if @small== "1"

        @small_image_price = ArtistImageList.find(:first, :conditions => ["artist_image_id =  ? and image_type_id = ?", @artist_img.id,1])

        @total = @small_image_price.price

      end

      if  @medium == "1"

        @medium_image_price = ArtistImageList.find(:first, :conditions => ["artist_image_id =  ? and image_type_id = ?", @artist_img.id,2])
        @total = @total+@medium_image_price.price
      end

      if @large == "1"

        @large_image_price = ArtistImageList.find(:first, :conditions => ["artist_image_id =  ? and image_type_id = ?", @artist_img.id,3])
        @total = @total + @large_image_price.price
      end
    else
      redirect_to :controller =>"user",:action=>"index"
      flash[:message] = "Please Login/create-account to purchase."
    end
  end

  def buy_photos
    
    if request.post?
      if session[:user_id]
        @user = User.find(session[:user_id])
        @artist_imag = ArtistImage.find_by_id(params[:id])
         

        @order = Order.new(params[:order])

        ActiveMerchant::Billing::Base.mode = :test

        @card_number = params[:order][:card_number]
        @verify_no  = params[:order][:card_verification_number]
        @first_name = params[:order][:first_name]
        @last_name = params[:order][:last_name]
        @card_type = params[:order][:card_type]
        @card_expires_on = params[:order][:card_expires_on]
        @month   = params[:date]["month"]
        @year   = params[:date]["year"]
        # Create a new credit card object
        credit_card = ActiveMerchant::Billing::CreditCard.new(
          :number     => @card_number,
          :month      => @month,
          :year       => @year,
          :first_name => @first_name,
          :last_name  => @last_name,
          :verification_value  => @verify_no,
          :type => @card_type
        )

        if credit_card.valid?

          init_options = {:login=>'53S7DEwRcK',:password=>'2qqu8H99N6R838Fa'}

          gateway =ActiveMerchant::Billing::AuthorizeNetGateway.new(init_options)

          
          # Capture the money
          amount = params[:total_amount].to_i

          response = gateway.authorize(amount, credit_card)
          

          if response.success?
           
            # mnth  =   params[:date]["month"]
            # month = 1  >> Date::MONTHNAMES[month]=> 'January

            

            if @order.save
              expire_year    =   params[:date]["year"]
              @order.card_expires_on =  expire_year
              @order.total_price = amount
              @order.transaction_id = response.authorization.to_i
              @order.artist_id = @artist_imag.artist_id
              @order.artist_image_name = @artist_imag.name
              @order.user_id = @user.id
              @order.success = true
              @order.save



              if !params[:small].blank?
                
                @order_tran1 = OrderTransaction.new
                @order_tran1.order_id = @order.id
                @order_tran1.image_type = "Small"
                @order_tran1.artist_id = @artist_imag.artist_id
                @order_tran1.save
              end
              if !params[:medium].blank?
                
                @order_tran2 = OrderTransaction.new
                @order_tran2.order_id = @order.id
                @order_tran2.image_type = "Medium"
                @order_tran2.artist_id = @artist_imag.artist_id
                @order_tran2.save
              end
              if !params[:large].blank?                
                @order_tran3 = OrderTransaction.new
                @order_tran3.order_id = @order.id
                @order_tran3.image_type = "Large"
                @order_tran3.artist_id = @artist_imag.artist_id
                @order_tran3.save
              end
            else
              flash[:message] = "Error while stroring values to database"
            end
            #render :text => 'Success:' + response.message.to_s and return
            redirect_to :action =>"main"
            flash[:message] = "#{response.message.to_s}"
           # puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"

          else
            render :text => 'Fail:' + response.message.to_s and return
          end
        else 
           redirect_to :action =>"transaction" ,:id=>@artist_imag.id,:small_image =>params[:small],:medium_image=>params[:medium],:large_image=>params[:large]
          flash[:message] = "#{credit_card.errors.full_messages.join(' <br /> ')}"
          
        end
      else
        flash[:message] = "Please Login"
        render :action =>"index"
      end    
    end
  end
end

