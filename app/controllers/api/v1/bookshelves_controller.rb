class Api::V1::BookshelvesController < ApplicationController
  def index
    @bookshelves = Bookshelf.all
    render json: @bookshelves
  end

  def show
    @books = Bookshelf.includes(:books).find(params[:id])
    render json: BookshelfListSerializer.new(@books), status: 200
  end


  def list
    @bookshelf_pages = Bookshelf.includes(:books).page(params[:page]).per(params[:results_per_page])
    render json: @bookshelf_pages, status: 200
  end
end
