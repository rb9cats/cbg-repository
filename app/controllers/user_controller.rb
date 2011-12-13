class UserController < ApplicationController
  before_filter :check_session, :except => [:index , :login, :signup,:create_account,:forgot_password,:activate_account]
  
  def index    
    if session[:user_id]
      redirect_to :controller=>"artist",:action => 'main'
    end
  end

  def login
    if request.post?
      login_email = params[:user][:email]
      session[:email] = login_email      
      login_password = params[:user][:password]     
      if login_email.blank? || login_password.blank?
        flash.now[:messgae] = "You must enter an Username and Password"
        render :action => "index"
      else
        user = User.authenticate(login_email,login_password)
        if user and user.active?         
          @user = User.find_by_email(session[:email])
          session[:user_id] = @user.id
          session[:username]= @user.username
          redirect_to :action => "dashboard"
        else
          if User.needs_activation?(params[:user][:email])
            flash.now[:messgae] = "You need to activate your account. Please check your Email inbox for the activation link."
          else
            flash.now[:messgae] = "Email and Password combination not found. Please Try again."
          end
          render :action => "index"
        end
      end
    else
      redirect_to :action => "index"
    end
  end
  
  def signup
  end

  def forgot_password
    if request.post?      
      if params[:user][:email].blank?        
        flash.now[:message] = "Plase enter a valid email address."
      else
        @forgot_email = params[:user][:email]
        session[:forgot_email] = @forgot_email
        user = User.find_by_email(@forgot_email)
        if user
          if user.active?
            user.reset_password
            flash.now[:message] = "A new password has been sent to your email. Please check your inbox for further instructions."
            redirect_to :action => "edit_profile"
          else
            flash.now[:message] =  "Your account is currently inactive, if you believe this is an error, please click the following <a href='/user/user_approve_request'>Request account activation</a>."
          end
        else
          flash.now[:message] = "Could not find account associated with that email. Please ensure it was entered correctly."
        end
      end
    end
  end

  def dashboard
    @user = User.find_by_id(session[:user_id])
  end
  
  def edit_profile
    @user = User.find(session[:user_id])
    if request.post? 
      if @user.update_attributes(params[:user])
        if !params[:password].blank?
        @user.password = @user.enc_pass(params[:password])
        end
        @user.save
        redirect_to :action => "dashboard"      
      end
    end
  end
  
  def create_account
    if request.post?
      @user = User.new(params[:user])
      if @user.save
        # @user.activate!
        flash[:messgae] = "Thank you for registering. Please check your mail to activate the account."
        redirect_to :action => 'index'
      else
        puts "****#{@user.errors.inspect}***********"
        @error_str = "<ul>"
        @user.errors.each_full { |msg| @error_str += "<li>#{msg}</li>" }
        @error_str += "<ul>"
        render :action => "signup"
      end
    else
      redirect_to :action => 'signup'
    end
  end
  
  def activate_account
    user = User.find_by_activation_code(params[:id])
    if user
      user.activate!
      flash[:messgae] = "Account activated. Please Login"
    else
      flash[:messgae] = "Activation code is invalid or account has already been activated. Please try login."
    end
    redirect_to :action=>'index'
    return
  end
  
  def logout
    reset_session
    redirect_to :action => "index"
  end
def transaction_history
    @orders = Order.find_all_by_user_id(params[:id])
     user   = User.find_by_id(params[:id])
     @user_name = user.first_name
  end
  
end



