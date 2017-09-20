class UsersController < ApplicationController
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
        image_name:"defa.png"
    )
    if @user.save
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

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー情報を編集しました"
    else
      render("users/edit")
    end

  end
  def destroy
    @user = User.find_by(id:params[:id])
    @user.destroy

    redirect_to("/")
    flash[:notice] = "退会しました"
  end
end
