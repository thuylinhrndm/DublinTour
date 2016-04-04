json.array!(@maps) do |map|
  json.extract! map, :id, :adress, :longitude, :latitude
  json.url map_url(map, format: :json)
end
