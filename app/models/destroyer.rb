class Destroyer < ActiveRecord::Base
  
  attr_accessor :photo_file_name
  
  belongs_to :creator, :class_name => "User"
  
  has_many :favorites
  
  validates_presence_of :name, :price, :description, :creator
  
  has_attached_file :photo,
                     :styles => {
                       :thumb => ["72x72#"],
                       :medium => ["300x300#"]
                     },
                     :default_url => '/images/default_destroyer.png',
                     :storage => :s3,
                     :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                     :path => "cs446/vegetarians/#{Rails.env}/:attachment/:id/:style.:extension"
  
  def is_favorite?
    !favorite.nil?
  end
  
  def favorite
    return @favorite if defined?(@favorite)
    @favorite = (favorites & current_user.favorites).first
  end
  
  def create_favorite
    @favorite = Favorite.create!(:user => current_user, :destroyer => self)
  end
  
  def delete_favorite
    favorite.delete!
    #@favorite = nil
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
    return @current_user_session
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
    return @current_user
  end
  
  def to_s
    self.name
  end
  
end
