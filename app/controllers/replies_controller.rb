class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :set_post

  load_and_authorize_resource

  # GET /replies/new
  def new
    @reply = Reply.new
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params)
    @reply.post = @post
    @reply.user = current_user

    if @reply.save
      redirect_to post_path(@reply.post), notice: 'Reply was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params)
      redirect_to post_path(@reply.post), notice: 'Reply was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy
    redirect_to post_path(@post), notice: 'Reply was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    # Only allow a trusted parameter "white list" through.
    def reply_params
      params.require(:reply).permit(:body)
    end
end
