class Likes < ApplicationController

  def create
    @like = Like.new(user_id:@current_user.id,post_id:params[:post_id])
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

end
