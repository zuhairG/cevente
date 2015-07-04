json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :desc, :web_add, :address1, :address2, :email, :type, :is_uni
  json.url organization_url(organization, format: :json)
end
