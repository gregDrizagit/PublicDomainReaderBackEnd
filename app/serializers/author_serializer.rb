class AuthorSerializer < ActiveModel::Serializer

  attributes :id, :name, :birth_year, :death_year
   # has_many :books
  # Author does not have many books
end
