class Picture < ApplicationRecord
  include PictureUploader[:picture]
end
