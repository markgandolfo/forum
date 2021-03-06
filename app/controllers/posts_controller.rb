class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_section, only: [:new, :edit, :update, :create, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  load_and_authorize_resource

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
    @replies = @post.replies.page(params[:page])
    @reply = Reply.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.section = @section

    if @post.save
      redirect_to section_post_path(@section, @post), notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_section
       @section = Section.find(params[:section_id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:section_id, :title, :body, :user_id)
    end
end
