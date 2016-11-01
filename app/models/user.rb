class User < ApplicationRecord
  has_secure_password

  has_many :links
  has_many :votes

end
