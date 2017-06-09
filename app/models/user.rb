class User < ActiveRecord::Base

  validates :email, uniqueness: true
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }

  has_secure_password

end