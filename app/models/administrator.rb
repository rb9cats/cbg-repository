class Administrator < ActiveRecord::Base
  before_create :encrypt_password
  
  def encrypt_password
    return if self.password.blank?
    self.password = Digest::SHA1.hexdigest(self.password + 'DCKAP')
  end

  def enc_pass(passwd)
    Digest::SHA1.hexdigest(passwd + 'DCKAP')
  end

  def self.authenticate(login_email, login_password)
    u = Administrator.find(:first, :conditions => ['email = ?', login_email])    
    if u
      u && u.enc_pass(login_password) == u.password ? u : nil
    else
      return nil
    end
  end
  
end
