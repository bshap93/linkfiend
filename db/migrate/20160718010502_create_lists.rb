class CreateLists < ActiveRecord::Migration
  def change
    create_table :list do |t|
      t.string :name
    end
  end
end
