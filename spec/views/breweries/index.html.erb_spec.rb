require 'spec_helper'

describe "breweries/index" do
  before(:each) do
    assign(:breweries, [
      stub_model(Brewery,
        :name => "Name",
        :url => "Url",
        :location => "Location",
        :year_opened => 1
      ),
      stub_model(Brewery,
        :name => "Name",
        :url => "Url",
        :location => "Location",
        :year_opened => 1
      )
    ])
  end

  it "renders a list of breweries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
