class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    @comment.user_id = current_user.id
    if @comment.save
      redirect_to topic_path(@comment.topic.id), success: 'コメントを追加しました'
    end
  end

  private
  def comment_params
  params.require(:comment).permit(:content,:topic_id)
  end
end
