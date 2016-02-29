json.array!(@tours) do |tour|
  json.extract! tour, :id, :tourtype, :day, :time
  json.url tour_url(tour, format: :json)
end
