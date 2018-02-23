class BookmarkSerializer < ActiveModel::Serializer

  attributes :id, :user, :book, :paragraph
  belongs_to :book
  belongs_to :user
  # Author does not have many books
end
