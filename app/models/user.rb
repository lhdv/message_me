class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 3, maximum: 15 }
  has_secure_password
end