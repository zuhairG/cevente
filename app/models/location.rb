class Location < ActiveRecord::Base

  has_many :event
  belongs_to :user
  validates_length_of :title,:address1,:address2, :maximum => 40
  validates_presence_of :country, :address1, :title
  #scope :location_for_user, :conditions => { :user_id => current_user.id }
  scope :by_user, lambda { |user|
      where(:user_id => user.id)
  }

end
