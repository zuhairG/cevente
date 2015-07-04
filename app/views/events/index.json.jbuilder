json.array!(@events) do |event|
  json.extract! event, :id, :title, :location_id, :desc, :start_date, :end_date, :free_food, :status, :event_type_id, :num_views, :rsvp_max, :image
  json.url event_url(event, format: :json)
end
