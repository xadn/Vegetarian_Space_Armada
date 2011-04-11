class Role < ActiveRecord::Base
  
  has_paper_trail
  
  validates_length_of :name, :minimum => 1
  validates_uniqueness_of :name

  has_many :users

  # override the name setter to strip leading and 
  # trailing whitespace as well as lowercase name
  def name=(n)
  	write_attribute(:name, n.strip.downcase)
  end

  # to_s method for roles, returns the name
  def to_s
  	name
  end
  
end



# == Schema Information
#
# Table name: roles
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)
#  users_count :integer         default(0)
#  created_at  :datetime
#  updated_at  :datetime
#

