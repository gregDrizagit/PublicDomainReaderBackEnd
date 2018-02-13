class Api::V1::SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
    render json: @subjects, status: 200
  end

  def show
    @subject = Subject.includes(:books).find(params[:id])
    render json: SubjectListSerializer.new(@subject), status: 200
  end

  def list
    @subject_pages = Subject.includes(:books).page(params[:page]).per(params[:results_per_page])
    # render json: {subjects: SubjectListSerializer.new(@subject_page)}, status: 200
    render json: @subject_pages, status: 200
  end
end
