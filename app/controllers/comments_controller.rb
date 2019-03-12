class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    if comment.save
      render topics_path, success:'コメントを追加しました'
    else
      render topics_path, danger:'コメントの追加に失敗しました'
    end
  end

  private
  def comment_params
  params.require(:comment).permit(:content)
  end
end
