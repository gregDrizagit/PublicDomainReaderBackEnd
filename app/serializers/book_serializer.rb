class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :html_url, :subjects, :author
  # :bookshelves
   has_many :subjects
  # has_many :bookshelves
end
