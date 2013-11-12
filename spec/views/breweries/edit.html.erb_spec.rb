require 'spec_helper'

describe "breweries/edit" do
  before(:each) do
    @brewery = assign(:brewery, stub_model(Brewery,
      :name => "MyString",
      :url => "MyString",
      :location => "MyString",
      :year_opened => 1
    ))
  end

  it "renders the edit brewery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", brewery_path(@brewery), "post" do
      assert_select "input#brewery_name[name=?]", "brewery[name]"
      assert_select "input#brewery_url[name=?]", "brewery[url]"
      assert_select "input#brewery_location[name=?]", "brewery[location]"
      assert_select "input#brewery_year_opened[name=?]", "brewery[year_opened]"
    end
  end
end
