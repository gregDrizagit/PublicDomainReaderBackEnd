class Subject < ApplicationRecord
  validates :name, uniqueness: true
  attr_accessor :subject_id, :subject_name, :subject_books
  has_many :book_subjects
  has_many :books, through: :book_subjects
end
