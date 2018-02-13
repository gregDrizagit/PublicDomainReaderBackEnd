class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :paragraph
    end
  end
end
