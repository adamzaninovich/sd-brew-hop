puts "Removing #{Brewery.count} breweries"
Brewery.delete_all

breweries = YAML.load File.read File.join(Rails.root, 'db', 'seeds', 'breweries.yml')
breweries.each do |brewery|
  Brewery.create! brewery
end

puts "Added #{Brewery.count} breweries"
