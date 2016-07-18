class RedoBookmark < ActiveRecord::Migration
  def change
    drop_table :bookmarks
    create_table :bookmarks do |t|
      t.string :name
      t.string :link
      t.string :description
      t.boolean :private
      t.integer :user_id
    end
  end
end
