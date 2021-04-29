class Picture < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :title, length: { in: 1..140 }
end
