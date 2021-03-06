class Destroyer < ActiveRecord::Base
  
  #attr_accessor :photo_file_name
  
  belongs_to :creator, :class_name => "User"
  has_many :users, :through => :favorites
  has_many :favorites, :dependent => :destroy
  
  cattr_reader :per_page
	@@per_page = 5
  
  validates_presence_of :name, :price, :description, :creator
  validates_numericality_of :price, :greater_than_or_equal_to => 0
  
  
  has_attached_file :photo,
                    :styles => {
                        :thumb => ["72x72#"],
                        :medium => ["300x300#"]
                      },
                    :default_url => '/images/default_destroyer.jpg',
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml", 
                    :path => "cs446/vegetarians/#{Rails.env}/:attachment/:id/:style.:extension"
  
  def to_s
    self.name
  end
  
end
