require 'spec_helper'

describe "breweries/show" do
  before(:each) do
    @brewery = assign(:brewery, stub_model(Brewery,
      :name => "Name",
      :url => "Url",
      :location => "Location",
      :year_opened => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Url/)
    rendered.should match(/Location/)
    rendered.should match(/1/)
  end
end
