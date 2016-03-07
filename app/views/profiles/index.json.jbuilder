json.array!(@profiles) do |profile|
  json.extract! profile, :id, :firstname, :lastname, :address, :user_id
  json.url profile_url(profile, format: :json)
end
