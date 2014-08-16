class Admin::SectionsController < Admin::AdminController
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /admin/sections
  def index
    @sections = Section.order('sections.category').order(:order)
  end

  # GET /admin/sections/1
  def show
  end

  # GET /admin/sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  def create
    @section = Section.new(section_params)

    if @section.save
      redirect_to admin_section_path(@section), notice: 'Section was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /sections/1
  def update
    if @section.update(section_params)
      redirect_to admin_section_path(@section), notice: 'Section was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /sections/1
  def destroy
    @section.destroy
    redirect_to admin_sections_path, notice: 'Section was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def section_params
      params.require(:section).permit(:title, :description, :order, :category)
    end
end