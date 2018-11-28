require 'rmagick'

class MakeSketch
  include Service
  def initialize(image)
    @image = image
  end

  def call
    img = Magick::Image.read("public#{@image.image_url}").first
    img = img.charcoal(100,0.25)
    img.write("public#{@image.image_url}")
  end
end
