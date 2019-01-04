require 'rails_helper'

RSpec.describe PictureUploader do

   it "generates image versions" do
    picture = Picture.create(image:  File.open("data/pencil_tile.gif"))
    assert_equal [:original, :thumbnail, :transformed], picture.image.keys
  end

end
