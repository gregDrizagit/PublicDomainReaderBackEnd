class Bookmark < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user, optional: true

end
