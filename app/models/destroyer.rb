class Destroyer < ActiveRecord::Base
  attr_accessible :name, :price, :description
  
  belongs_to :user
  
  validates_presence_of :name, :price, :description, :user
  
end
