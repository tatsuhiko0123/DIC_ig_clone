class User < ApplicationRecord
  has_many :pictures
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
