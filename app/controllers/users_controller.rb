class UsersController < ApplicationController



  def index
    @users = User.all
    @songs = Song.all
  end

  def show
    @user = User.find(params[:id])
    @songs = @user.songs.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #UserMailer.account_activation(@user).deliver_now
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      session[:user_id] = @user.id
      # activated? が「偽」である限り、ログインできないようにした方がいいかな
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @users = User.all
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Cool"
      redirect_to @user
    else
      redirect_to @users
    end
  end

  def destroy
    session[:user_id] = nil
    User.find(params[:id]).destroy
    flash[:success] = "ユーサーは削除されました"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
