json.array!(@rsvps) do |rsvp|
  json.extract! rsvp, :id, :user_id, :event_id, :status, :rsvp_num
  json.url rsvp_url(rsvp, format: :json)
end
