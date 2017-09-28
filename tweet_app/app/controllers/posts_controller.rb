class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only:[:edit,:update,:destroy]}


  def index
    @posts = Post.all.order(created_at: :desc)
    @post = Post.new
  end
  def show
    @post = Post.find_by(id:params[:id])
    @user = @post.user
    @like_count = Like.where(post_id:@post.id).count
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(content:params[:content],user_id:@current_user.id)

    if @post.save
      redirect_to("/posts/index")
      flash[:notice] = "投稿が完了しました"
    else
      render("posts/new")
    end
  end
  def edit
    @post = Post.find_by(id:params[:id])
  end
  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]

    if @post.save == true
      redirect_to("/posts/index")
      flash[:notice] = "投稿を編集しました"
    else
      render("posts/edit")
    end

  end
  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy

    redirect_to("/posts/index")
    flash[:notice] = "投稿を削除しました"
  end
  def ensure_correct_user
    post = Post.find_by(id:params[:id])
    if @current_user.id != post.user_id.to_i
      flash[:notice] = "アクセス権限がありません"
      redirect_to("/posts/index")
    end
  end
  def create0
    @like = Like.new(user_id:@current_user.id,post_id:params[:post_id])
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end
  def destroy0
    @like = Like.find_by(user_id:@current_user.id,post_id:params[:post_id])
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end

end
