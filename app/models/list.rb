class List < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, through: :bookmark_lists
  has_many :bookmark_lists
end