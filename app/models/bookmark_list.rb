class BookmarkList < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :list
end