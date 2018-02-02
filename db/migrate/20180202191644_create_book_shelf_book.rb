class CreateBookShelfBook < ActiveRecord::Migration[5.1]
  def change
    create_table :bookshelf_books do |t|
      t.belongs_to :bookshelf, foreign_key: true
      t.belongs_to :book, foreign_key: true
    end
  end
end
