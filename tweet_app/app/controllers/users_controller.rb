class UsersController < ApplicationController
  before_action :authenticate_user, {only:[:index,:show,:edit,:update]}
  before_action :forbit_login_user, {only:[:create,:new,:login,:login_form]}
  before_action :ensure_correct_user, {only:[:edit,:update]}
  def index
    @users = User.all.order(created_at: :desc)
  end
  def show
    @user = User.find_by(id:params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(
        name:params[:name],
        email:params[:email],
        password:params[:password],
        image_name:"defa.png"
    )
    if @user.save
#新規登録時にログインした状態から始める
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "登録ができました"
    else
      render("users/new")
    end
  end
  def edit
    @user = User.find_by(id:params[:id])
  end
  def update

    @user = User.find_by(id:params[:id])
    @user.name = params[:name]
    @user.email =params[:email]

     params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)


    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー情報を編集しました"
    else
      render("/users/edit")
    end

  end
  def destroy
    @user = User.find_by(id:params[:id])
    @user.destroy

    redirect_to("/")
    flash[:notice] = "退会しました"
  end
  def login_form
  end
  def login
    #ログインの時の処理
    @user = User.find_by(email: params[:email])
    if @user &&  @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたは．パスワードが正しくありません．"
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウト"
    redirect_to("/login")
  end
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "アクセス権限がありません"
      redirect_to("/posts/index")
    end
  end
  def likes
    @user = User.find_by(id:params[:id])
    @likes = Like.where(user_id:@user.id)
  end
end
