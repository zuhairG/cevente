class Organization < ActiveRecord::Base
  has_many  :users , :through => :user_org

end
