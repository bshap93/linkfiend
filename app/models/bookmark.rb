class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :lists, through: :bookmark_lists
  has_many :tags, through: :bookmark_tags
  has_many :bookmark_lists
  has_many :bookmark_tags
end