class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :pdf_url, :author
  # has_many :subjects
  # has_many :bookshelves
end
