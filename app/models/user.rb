class User < ActiveRecord::Base
  has_secure_password

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  has_many :bookmarks
  has_many :tags
  has_many :lists
end