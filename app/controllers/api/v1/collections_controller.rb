class Api::V1::CollectionsController < ApplicationController

  def index
    @collections = Collection.all
    render json: @collections, status:200
  end

  def create

    book = Book.find_by(id: params[:book_id])
    new_collection = Collection.find_by(name: params[:collection])
    new_collection.books << book
  end
end
