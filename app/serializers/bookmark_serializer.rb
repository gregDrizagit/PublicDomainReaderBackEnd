class BookmarkSerializer < ActiveModel::Serializer

  attributes :id, :user_id, :book_id, :paragraph
   # has_many :books
  # Author does not have many books
end
