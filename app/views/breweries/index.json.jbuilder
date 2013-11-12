json.array!(@breweries) do |brewery|
  json.extract! brewery, :name, :url, :location, :year_opened
  json.url brewery_url(brewery, format: :json)
end
