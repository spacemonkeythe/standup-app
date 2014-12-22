class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @standup = Standup.find(params[:id])
    @comment = @standup.comments.create(comment_params)

    if @comment.save
      redirect_to @standup 
    else
      render "new"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
