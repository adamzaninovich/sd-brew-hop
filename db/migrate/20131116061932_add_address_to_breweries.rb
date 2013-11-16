class AddAddressToBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :address, :text
    add_column :breweries, :latitude, :float
    add_column :breweries, :longitude, :float
  end
end
