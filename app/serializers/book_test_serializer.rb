class BookTestSerializer < ActiveModel::Serializer
   attributes :id, :title, :img_url, :html_url, :author, :subjects
   belongs_to :author
end
