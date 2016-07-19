class User < ActiveRecord::Base
  has_secure_password

  extend Slugifiable::ClassMethods
    
  def slug
    self.username.downcase.split(" ").join("-")
  end

  has_many :bookmarks
  has_many :tags
  has_many :lists
end