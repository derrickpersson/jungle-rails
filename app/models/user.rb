class User < ActiveRecord::Base

# This applies Bcrypt when new users are created.
  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 1 }


  def authenticate_with_credentials(email, password)
    emailCleaned = email.strip.downcase
    @user = User.find_by_email(emailCleaned)
    if @user.authenticate(password)
      @user
    else
      nil
    end
  end
end