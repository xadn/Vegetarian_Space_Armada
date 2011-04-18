class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :destroyer  
  validates_presence_of :user, :destroyer  
end
