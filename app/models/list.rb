class List < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :user
  has_many :bookmarks, through: :bookmark_lists
  has_many :bookmark_lists
end