require 'spec_helper'

describe Brewery do
  let(:brewery) { Brewery.create! name: 'The Brewery' }
  describe '#leaderboard' do
    let(:user1) { User.create! }
    let(:user2) { User.create! }
    it "returns the top hoppers in order" do
      1.times { Hop.create! user:user1, brewery:brewery }
      2.times { Hop.create! user:user2, brewery:brewery }
      brewery.leaderboard.should == [ [user2,2], [user1,1] ]
    end
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

