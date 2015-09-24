class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post = @post
    if @comment.save
      redirect_to [@post.topic, @post], notice: "Comment saved successfully."
    else
      redirect_to [@post.topic, @post], notice: "Comment failed to save."
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed."

    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end
    redirect_to [@post.topic, @post]
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
