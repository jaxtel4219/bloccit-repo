class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @user_id = current_user
    @post= post_id
    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
  
  private
  def comment_params
    params.require(:body)
  end
end
