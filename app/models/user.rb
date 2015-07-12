class User < ActiveRecord::Base

  #attr_accessible :admin, :student, :uni_admin, :event_creator
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :events , :through => :user_events
   has_many  :organization , :through => :user_org
   has_many :rsvps


end
