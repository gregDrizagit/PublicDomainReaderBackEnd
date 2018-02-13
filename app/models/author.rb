class Author < ApplicationRecord
  #we need to to validate the uniqueness of the authors name
  attr_accessor :author_id, :author_name, :author_birth_year, :author_death_year

  validates :name, uniqueness: true
  has_many :books


end
