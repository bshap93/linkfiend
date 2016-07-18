class Tag < ActiveRecord::Base
  has_many :bookmarks, through: :bookmark_tags
  has_many :bookmark_tags
  belongs_to :user
end