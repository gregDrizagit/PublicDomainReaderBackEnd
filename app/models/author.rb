class Author < ApplicationRecord
  #we need to to validate the uniqueness of the authors name
  validates :name, uniqueness: true
  has_many :books


end
