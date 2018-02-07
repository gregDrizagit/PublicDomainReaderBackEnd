class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.belongs_to :author, foreign_key: true
      t.belongs_to :collection, foreign_key: true
      t.belongs_to :bookshelf, foreign_key: true
      t.string :img_url
      t.string :html_url
    end
  end
end
