class Book < ApplicationRecord
  validates :title, uniqueness: true
  has_many :book_subjects
  has_many :subjects, through: :book_subjects
  has_many :bookshelf_books
  has_many :bookshelves, through: :bookshelf_books
  belongs_to :author, optional: true

end
