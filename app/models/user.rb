class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :email, :uniqueness => {:case_sensitive => false}
  validates :email, presence: true
  validates :name, presence: true
  validates :password_confirmation, presence:true
  validates :password, length: { minimum: 6}
  before_save :downcase_email


  def downcase_email
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password)
        @user
    else
      nil
    end
  end

end
