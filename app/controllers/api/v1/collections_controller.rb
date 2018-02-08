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

  def new

    collection = Collection.find_by(name: params[:collection_name])
    if collection
      puts "Already exists"
      render json: {errors: "There is already a collection by that name"}, status: 400
    else
      new_collection = Collection.create(name: params[:collection_name], user_id: params[:current_user][:user][:id])
      render json: new_collection, status: 200
    end
  end
end
