class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :url
      t.string :location
      t.integer :year_opened

      t.timestamps
    end
  end
end
