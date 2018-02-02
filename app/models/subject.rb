class Subject < ApplicationRecord
  validates :name, uniqueness: true
  has_many :book_subjects
  has_many :books, through: :book_subjects
end
