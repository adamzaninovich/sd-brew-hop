class AddImageToBreweries < ActiveRecord::Migration
  def change
    add_column :breweries, :image, :string
  end
end
