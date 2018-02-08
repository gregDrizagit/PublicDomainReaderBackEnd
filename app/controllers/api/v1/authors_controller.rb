class Api::V1::AuthorsController < ApplicationController

  def index
    @authors = Author.all
    render json: @authors, status: 200
  end

  def list
    @authors_pages = Author.page(params[:page]).per(params[:results_per_page])
    render json: @authors_pages, status: 200
  end
end
