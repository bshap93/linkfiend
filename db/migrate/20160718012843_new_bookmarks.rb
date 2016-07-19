class NewBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :link
      t.string :description
      t.boolean :secret
    end
  end
end
