class User < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :username
  validates_presence_of :password
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_format_of :email,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  validates_uniqueness_of :username

  has_many :orders
  
  before_create :encrypt_password, :make_activation_code
  after_create :send_thank_you_email
  def encrypt_password
    return if self.password.blank?
    self.password = Digest::SHA1.hexdigest(self.password + 'DCKAP')
  end

  def enc_pass(passwd)
    Digest::SHA1.hexdigest(passwd + 'DCKAP')
  end

  def self.authenticate(login_email, login_password)
    u = User.find(:first, :conditions => ['email = ? and activated_at IS NOT NULL', login_email])
    if u
      u && u.enc_pass(login_password) == u.password ? u : nil
    else
      return nil
    end
  end
  
  def make_activation_code
    self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split('//').sort_by {rand}.join )
  end
  
  def activate!
    self.activation_code = nil
    self.activated_at = Time.now
    self.save
  end

  def reset_password
    new_passwd = random_string(10)
    self.password =  self.enc_pass(new_passwd)
    self.save
    UserNotifier.deliver_new_password(self,new_passwd)
  end

  def random_string(len)
    #generat a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  def self.needs_activation?(email)
    u = User.find_by_email(email)
    u && u.activated_at.nil?
  end

  def send_thank_you_email
    UserNotifier.deliver_thank_you_email(self)
  end
  
end
