class Location < ActiveRecord::Base

  has_many :event
  belongs_to :user
  #scope :location_for_user, :conditions => { :user_id => current_user.id }
  scope :by_user, lambda { |user|
      where(:user_id => user.id)
  }

end
