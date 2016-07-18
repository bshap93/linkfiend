class CreateListsAgain < ActiveRecord::Migration
  def change
    drop_table :list
  end
end
