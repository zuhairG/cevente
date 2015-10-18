class Event < ActiveRecord::Base
  has_attached_file :image,
  :url => "/system/:attachment/:id/:style/:filename"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/



  has_many :users , :through => :user_events
  has_one :type
  has_one :location
  has_many :rsvps
  has_many :invites


end
