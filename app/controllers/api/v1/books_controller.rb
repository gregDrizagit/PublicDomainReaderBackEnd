class Api::V1::BooksController < ApplicationController
  #validates the uniqueness of the book title
  def index
    @books = Book.all
    render json: @books, status: 200
  end

  def show
    @book = Book.find(params[:id])
    render json: @book, status:200
  end

  def search
    @books_results = Book.where("title LIKE ?", "%#{params[:query]}%")
    @subjects_results = Subject.where("name LIKE ?", "%#{params[:query]}")
    @authors_results = Author.where("name LIKE ?", "%#{params[:query]}")
    @bookshelves_results = Bookshelf.where("name LIKE ?", "%#{params[:query]}")
    serialized_books = @books_results.collect do |book|
      
      BookSerializer.new(book)
    end
    if @books_results || @subjects_results || @authors_results || @bookshelves_results
       render json: {filteredBooks: serialized_books, filteredSubjects: @subjects_results, filteredAuthors: @authors_results, filteredBookshelves: @bookshelves_results}, status: 200
     else
      render json: {error: "Couldn't find anything..."}, status: 401
    end
  end

  def list
    @book_pages = Book.includes(:author, :subjects).page(params[:page]).per(params[:results_per_page])
    render json: @book_pages, status: 200
  end

end
