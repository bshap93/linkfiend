class User < ActiveRecord::Base
  has_secure_password
  has_many :bookmarks
  has_many :tags
  has_many :lists
end