require "image_processing/mini_magick"

class PictureUploader < Shrine
  
  include ImageProcessing::MiniMagick
  
  plugin :pretty_location  
  plugin :validation_helpers
  plugin :processing
  plugin :versions
  plugin :determine_mime_type
  plugin :delete_promoted
  plugin :delete_raw
  plugin :pretty_location

  Attacher.validate do 
   validate_mime_type_inclusion ["image/jpg", "image/jpeg", "image/png", "image/gif"]
   validate_extension_inclusion %w[jpg jpeg png gif]
  end
 
  process(:store) do |io|
    versions = { original: io }
    io.download do |original|
      processor = ImageProcessing::MiniMagick.source(original)
      versions[:thumbnail] = processor.resize_to_limit!(300,300)
      versions[:transformed] = processor.colorspace! "Gray"
    end
  end
end
