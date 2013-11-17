# encoding: utf-8
class HopImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process resize_to_limit: [640, 640]

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_limit: [457, 457]
  end

  def extension_white_list
    %w|jpg jpeg gif png|
  end

  def filename
    "#{model.name.parameterize}.#{file.extension}" if original_filename
  end

end
