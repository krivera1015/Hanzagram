class User < ApplicationRecord
  validates :username, presence: true
  # has_many :posts
  # has_one_attached :avatar
  has_secure_password
end
