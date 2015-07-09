class PostsController < ApplicationController
  before_filter :authenticate_user!  
  def index
    #@posts = Post.all
    @posts = policy_scope(Post)
    #authorize @posts
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end
  
  def create
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
    
  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post = Post.find(params[:id])
    @post.destroy
    if @post.destroy
      flash[:notice] = "post was deleted."
      redirect_to @post
    else
      flash[:error] = "There was an error deleting the post. Please try again."
      render :destroy
    end
  end
  
end
