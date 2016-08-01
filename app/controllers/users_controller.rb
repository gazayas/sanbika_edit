class UsersController < ApplicationController

  def index
    @users = User.all
    # @songs = Song.all.order()
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
      flash[:info] = "アカウントをアクティベートするにはメールで送信されたリンクをクリックしてください"
      # session[:user_id] = @user.id これをコメントアウトしたのは、ユーザーが最初にアカウントをアクティベートするためです
      # activated? が「偽」である限り、ログインできないようにした方がいいかな
      redirect_to '/'
    else
      # flash[:danger] = @user.errors
      message = ""
      @user.errors.full_messages.each do |error|
        message += error + ".  "
      end
      flash[:danger] = message
      redirect_to '/signup'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @users = User.all
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィルを更新しました"
      redirect_to @user
    else
      flash[:danger] = "今の気分を更新できませんでした。文字数が140を越えていないか確認した上、もう一度ご投稿ください"
      redirect_to @user
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :status)
  end


end
