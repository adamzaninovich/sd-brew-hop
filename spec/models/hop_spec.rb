require 'spec_helper'

describe Hop do
  describe '#success_message' do
    let(:brewery) { Brewery.create! name: 'Ballast Point' }
    let(:user1) { User.create! }
    let(:user2) { User.create! }
    before do
      1.times { Hop.create! user: user1, brewery: brewery }
      2.times { Hop.create! user: user2, brewery: brewery }
    end
    it "contains the brewery name" do
      Hop.first.success_message.should include "Ballast Point"
    end
    it "contains the number of hops for that user" do
      user2.hops.last.success_message.should include "twice"
    end
    it "says first for the first visit" do
      user1.hops.last.success_message.should include "first"
    end
    it "says keep hopping for non top hopper" do
      user1.hops.last.success_message.should include "Keep Hopping"
    end
    it "says top hopper for non top hopper" do
      user2.hops.last.success_message.should include "Top Hopper"
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

