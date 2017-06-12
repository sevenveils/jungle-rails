class User < ActiveRecord::Base

  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :password, length: { minimum: 8}, allow_nil: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by(email: email.downcase.strip)

    if user && user.authenticate(password)
      user
    end
  end

end
