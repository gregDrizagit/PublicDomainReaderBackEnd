class CreateBookSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :book_subjects do |t|
      t.belongs_to :book, foreign_key: true
      t.belongs_to :subject, foreign_key: true
    end
  end
end
