class Event < ActiveRecord::Base

  acts_as_attendable :event_members, by: :users

  has_attached_file :image,
  :url => "/system/:attachment/:id/:style/:filename",
  :styles => { :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "default_event.jpg"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of  :start_date, :end_date,:address1,:city,:country
  has_one :location
  belongs_to :user
  has_one :type

  after_validation(on: :create) do
      errors.add(:start_date, "must be before End date") unless
      if !self.start_date.nil? && !self.end_date.nil?
        (self.start_date <= self.end_date)
      end
end
end
