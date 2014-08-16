class SectionsController < ApplicationController

  # GET /sections
  def index
    @sections = Section.order('sections.category').order(:order)
  end

  # GET /sections/1
  def show
    @section = Section.find(params[:id])
    @posts = @section.posts.page(params[:page])
  end
end
