class FavoritesController < ApplicationController
  def index
    @favorite_topics =current_user.favorite_topics
  end

  def create
    favorite = Favorite.new(user_id: current_user.id,topic_id: params[:topic_id])
   if favorite.save
    redirect_to topics_path, success: 'いいね!されました'
   else
    redirect_to topics_path, danger: 'いいね!に失敗しました'
   end
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id,topic_id: params[:id])
    if favorite.destroy
      redirect_to topics_path, warning: 'いいねを取り消しました'
    else
      redirect_to topics_path, warning: 'いいねを取り消しに失敗しました'
    end
  end

end
