class Bookshelf < ApplicationRecord
  validates :name, uniqueness: true
  has_many :bookshelf_books
  has_many :books, through: :bookshelf_books
end
