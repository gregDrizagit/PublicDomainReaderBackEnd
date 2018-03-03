class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.longtext :title
      t.integer :author_id
      t.integer :collection_id
      t.integer :bookshelf_id
      t.string :img_url
      t.string :html_url
    end
  end
end
