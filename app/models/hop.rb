class Hop < ActiveRecord::Base
  include PublicActivity::Model
  belongs_to :user
  belongs_to :brewery

  mount_uploader :image, ImageUploader

  tracked owner: ->(_,hop) { hop.user }

  scope :for_brewery_and_user, ->(brewery,user) { for_brewery(brewery).for_user(user) }
  scope :for_brewery, ->(brewery) { where brewery: brewery }
  scope :for_user, ->(user) { where user:user }

  def self.friends_hops_for_brewery_and_user brewery, current_user
    if current_user.friends.any?
      for_brewery(brewery).where(user_id:current_user.friends.map(&:id)).order 'created_at desc'
    else
      []
    end
  end

  def to_param
    "#{id}-#{user.name}".parameterize
  end

  def success_message
    message = "<strong>Congrats!</strong> You Hopped #{brewery.name}!"
    message << hop_count_message
    message << leaderboard_standings_message
  end

  def user_name current_user=nil
    if current_user && user == current_user
      "You"
    else
      user.name
    end
  end

  private

  def leaderboard_standings_message
    if brewery.leaderboard.first.first == user
      " You are the Top Hopper here!"
    else
      " Keep Hopping!"
    end
  end

  def hop_count_message
    hops_here = Hop.for_brewery_and_user(brewery, user).count
    if hops_here == 1
      " This is your <strong>first</strong> Hop here."
    else
      " You have Hopped here #{hops_here} times.".gsub '2 times', 'twice'
    end
  end

end

# == Schema Information
#
# Table name: hops
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  brewery_id :integer
#  image      :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

