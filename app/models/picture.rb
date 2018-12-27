class Picture < ApplicationRecord
  include PictureUploader[:image]
  validates :image, presence: true
end
