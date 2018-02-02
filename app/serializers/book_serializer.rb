class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :img_url, :pdf_url, :author

end
