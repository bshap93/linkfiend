class MakeBookmarks < ActiveRecord::Migration
  def change
    rename_column :bookmarks, :private, :secret
  end
end
