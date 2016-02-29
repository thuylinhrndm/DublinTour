json.array!(@profiles) do |profile|
  json.extract! profile, :id, :firstname, :lastname, :email, :phone
  json.url profile_url(profile, format: :json)
end
