class Event < ActiveRecord::Base
  acts_as_attendable :event_members, by: :users

  has_attached_file :image,
  :url => "/system/:attachment/:id/:style/:filename",
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "default_event.jpg"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :location_id, :start_date, :end_date
  has_one :location
  belongs_to :user
  has_one :type

end
