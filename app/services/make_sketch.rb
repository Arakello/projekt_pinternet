
class MakeSketch
  include Service
  def initialize(original)
    @original = "public"+original
  end

  def call
    MiniMagick::Tool::Magick.new do |magick|
        magick << @original

        magick.colorspace("gray")
        magick << "\("
        magick.clone.+
        magick.tile("data/pencil_tile.gif")
        magick.draw("color 0,0 reset")
        magick.clone.+
        magick.swap.+
        magick.compose("color_dodge")
        magick.composite
        magick << "\)"
        magick.fx("u*.2+v*.8")
        magick << @original 
        magick.call
    end

  end
end
