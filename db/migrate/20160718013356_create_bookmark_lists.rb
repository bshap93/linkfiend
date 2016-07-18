class CreateBookmarkLists < ActiveRecord::Migration
  def change
    create_table :bookmark_lists do |t|
      t.integer :bookmark_id
      t.integer :list_id
    end
  end
end
