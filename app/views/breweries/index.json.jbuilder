json.array! @breweries do |brewery|
  json.extract! brewery, :name, :latitude, :longitude
  json.image brewery.image_url :thumb
  json.hop_count brewery.hops.count
  json.url brewery_url brewery, format: :json
end
