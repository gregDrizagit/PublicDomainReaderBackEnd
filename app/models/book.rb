class Book < ApplicationRecord
  validates :title, uniqueness: true
  attr_accessor :book_id, :book_title, :book_author_id
  has_many :book_subjects
  has_many :subjects, through: :book_subjects
  has_many :bookshelf_books
  has_many :bookshelves, through: :bookshelf_books
  belongs_to :author, optional: true

end
