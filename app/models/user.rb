class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 4, maximum: 16}
  has_many :posts, dependent: :destroy
  # has_one_attached :avatar
  has_secure_password
  has_many :comments, dependent: :destroy

end
