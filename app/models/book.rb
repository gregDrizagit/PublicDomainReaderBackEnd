class Book < ApplicationRecord
  has_many :subjects
  has_one :author
end
