json.array!(@hops) do |hop|
  json.extract! hop, :user_id, :brewery_id, :image, :message
  json.url hop_url(hop, format: :json)
end
