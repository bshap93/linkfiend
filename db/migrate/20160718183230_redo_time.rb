class RedoTime < ActiveRecord::Migration
  def change
    add_timestamps(:bookmarks)
  end
end
