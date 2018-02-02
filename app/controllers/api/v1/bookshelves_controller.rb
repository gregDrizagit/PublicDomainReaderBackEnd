class Api::V1::BookshelvesController < ApplicationController
  def index
    @bookshelves = Bookshelf.all
    render json: @bookshelves
  end
end
