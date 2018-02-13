class BookSerializer < ActiveModel::Serializer
  # include FastJsonapi::ObjectSerializer

  attributes :id, :title, :img_url, :html_url, :author, :subjects
  belongs_to :author

  #belongs_to :author
end
