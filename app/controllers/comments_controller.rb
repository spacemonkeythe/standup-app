class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @standup = Standup.find(params[:standup_id])
    @comment = @standup.comments.build(comment_params)
    @comment.user = current_user
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
