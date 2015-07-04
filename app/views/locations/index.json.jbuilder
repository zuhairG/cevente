json.array!(@locations) do |location|
  json.extract! location, :id, :title, :address1, :address2, :country, :city, :zipcode, :state, :phone_num
  json.url location_url(location, format: :json)
end
