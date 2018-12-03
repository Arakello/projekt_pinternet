require 'rmagick'

class MakeSketch
  include Service
  def initialize(image)
    @image = image
  end

  def call
    img="public"+@image.image_url
    system("sh skrypt.sh #{img}")
  end
end
