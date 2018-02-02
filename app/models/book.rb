class Book < ApplicationRecord
  validates :title, uniqueness: true
  has_many :subjects
  has_one :author

end
