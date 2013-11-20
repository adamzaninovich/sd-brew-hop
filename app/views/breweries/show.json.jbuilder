json.extract! @brewery, :name, :latitude, :longitude, :location, :year_opened
if @brewery.address?
  address_parts = @brewery.address.gsub(/\r\n?/, '||').split '||'
  json.address_line_1 address_parts.shift
  json.address_line_2 address_parts.shift
end
json.website @brewery.url
json.image @brewery.image_url
json.image_thumb @brewery.image_url :thumb
json.hops @brewery.hops do |hop|
  json.user do
    json.name hop.user_name current_user
    json.image hop.user.image
  end
  json.time hop.created_at
  json.image hop.image_url :thumb
  json.message hop.message
  json.url brewery_hop_url @brewery, hop, format: :json
end
