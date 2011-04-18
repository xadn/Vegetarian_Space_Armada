class Favorite < ActiveRecord::Base
  belongs_to :user
  has_one :destroyer  
  validates_presence_of :user, :destroyer  
end
