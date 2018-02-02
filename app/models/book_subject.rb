class BookSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :book
end
