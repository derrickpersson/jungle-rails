class User < ActiveRecord::Base

# This applies Bcrypt when new users are created.
  has_secure_password

end
