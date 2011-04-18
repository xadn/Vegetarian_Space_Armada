class Destroyer < ActiveRecord::Base
  
  belongs_to :user
  
  validates_presence_of :name, :price, :description, :user
  
  def to_s
    name
  end
  
end
