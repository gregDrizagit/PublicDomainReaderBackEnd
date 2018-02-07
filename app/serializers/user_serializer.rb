class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :user_name, :collections
  has_many :collections
  

end
