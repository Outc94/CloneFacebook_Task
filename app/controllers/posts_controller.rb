class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def show
  end
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  def edit
  end
  def create
    @post = Post.new(post_params)
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: "Post was created SUCCESSFULLY." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def confirm
    @post = Post.new(post_params)
  end
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was updated SUCCESSFULLY.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was deleted SUCCESSFULLY.' }
      format.json { head :no_content }
    end
  end
  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :user_id)
  end
end
