class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :caption, presence: true
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy
end
