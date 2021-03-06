# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process resize_to_limit: [640, 640]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [457, 457]
  end

  version :wall do
    process resize_to_fill: [30, 30]
  end

  version :tiny do
    process resize_to_fill: [20, 20]
  end

  def extension_white_list
    %w|jpg jpeg gif png|
  end

  def filename
    if original_filename
      fname = case model.class.to_s
      when "Brewery"
        "#{model.name.underscore}"
      when "Hop"
        "#{model.brewery.name.parameterize}-#{model.user.name.parameterize}"
      end
      "#{fname}.#{file.extension}" if fname
    end
  end

end
