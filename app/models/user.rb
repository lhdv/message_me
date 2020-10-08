class User < ApplicationRecord
  has_many :messages

  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, length: { minimum: 3, maximum: 15 }
  
  has_secure_password
end