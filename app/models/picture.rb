class Picture < ApplicationRecord
  include PictureUploader[:image]
end
