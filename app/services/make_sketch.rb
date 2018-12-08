require 'rmagick'

class MakeSketch
  include Service
  def initialize(picture)
    @picture = picture
  end

  def call
    pic="public"+@picture.picture_url
    system("sh skrypt.sh #{pic}")
  end
end
