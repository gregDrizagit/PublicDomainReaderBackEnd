class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :books, :name
  has_many :books
end
