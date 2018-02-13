class AuthorListSerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_year, :death_year
  has_many :books
end
