class Api::V1::SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
    render json: @subjects, status: 200
  end

  def list
    @subject_pages = Subject.page(params[:page]).per(params[:results_per_page])
    render json: @subject_pages, status: 200
  end
end
