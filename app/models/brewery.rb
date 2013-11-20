class Brewery < ActiveRecord::Base
  has_many :hops

  mount_uploader :image, ImageUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def has_location?
    latitude.present? && longitude.present?
  end

  def leaderboard
    User.all.map do |user|
      [user, Hop.for_brewery_and_user(self, user).count]
    end.sort_by(&:last).reverse
  end
end

# == Schema Information
#
# Table name: breweries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  url         :string(255)
#  location    :string(255)
#  year_opened :integer
#  created_at  :datetime
#  updated_at  :datetime
#  image       :string(255)
#  address     :text
#  latitude    :float
#  longitude   :float
#

