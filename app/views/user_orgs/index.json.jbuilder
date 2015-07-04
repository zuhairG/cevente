json.array!(@user_orgs) do |user_org|
  json.extract! user_org, :id, :user_id, :organization_id
  json.url user_org_url(user_org, format: :json)
end
