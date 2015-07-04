class Event < ActiveRecord::Base


  has_many :users , through => :user_events
  has_one :type
  has_one :location
  has_many :rsvps
  has_many :invites

  
end
