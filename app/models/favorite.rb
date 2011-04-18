class Favorite < ActiveRecord::Base
  validates_presence_of :user, :destroyer 
end
