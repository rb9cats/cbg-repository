class UserNotifier < ActionMailer::Base

  def thank_you_email(user)
    @subject    = 'Thank you for registering'
    @body["title"] = 'Thank you for registering'
    @recipients = user.email
    @body["url"] = "http://kh.cherrybranchgallery.com:3000/user/activate_account/#{user.activation_code}"
    @body["first_name"] = user.first_name    
    @from       = 'admin@cherrybranchgallery.com'    
  end

  def new_password(user, new_passwd)
    @subject    = 'Your Password - CherryBranchGallery.com'
    @body["title"] = 'Forgot Password'
    @body["password"] = new_passwd
    @recipients = user.email
    @from       = 'admin@cherrybranchgallery.com'    
  end
end
