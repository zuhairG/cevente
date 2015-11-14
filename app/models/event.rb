class Event < ActiveRecord::Base
  has_attached_file :image,
  :url => "/system/:attachment/:id/:style/:filename",
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "default_event.jpg"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  belongs_to :user
  has_one :type
  has_one :location
  has_many :rsvps
  has_many :invites


end
