class User < ApplicationRecord
  has_secure_password
  # has_many :subjects
  # has_many :books, through: :subjects
  has_many :collections
  has_many :books, through: :collections
end
