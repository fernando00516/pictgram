class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    if @comment.save
      redirect_to topic_path(:id), success:"コメントを追加しました"
    end
  end

  private
  def comment_params
  params.require(:comment).permit(:content)
  end
end
