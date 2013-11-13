class Brewery < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
