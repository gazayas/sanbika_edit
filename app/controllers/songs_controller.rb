class SongsController < ApplicationController

  before_filter :authorize, :only => [:new, :edit]

  def index
  end

  def show
    @user = User.find(params[:user_id])
    @song = @user.songs.find(params[:id]) # 複数形にした方がいいかな
  end

  def new
    @user = User.find(params[:user_id])
    @song = @user.songs.build
  end

  def create
    @user = User.find(params[:user_id])
    @song = @user.songs.create(song_params)
    if @song.save
      redirect_to :action => "show", :id => @song.id
    else
      redirect_to @user # songのnewアクションの方がいい
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @song = @user.songs.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @song = @user.songs.find(params[:id])
    if @song.update_attributes(song_params)
      flash[:succes] = "編集されました"
      redirect_to user_song_path(@user, @song)
    else
      redirect_to user_song_path(@user, @song)
      flash[:notice] = "歌を保存できませんでした" # これの代わりにエラーのメッセージを表示すること
    end
  end

  def destroy
    @user_id = Song.find(params[:id]).user_id # 削除してから元のユーザーのページに戻るために
    Song.find(params[:id]).destroy
    flash[:success] = "賛美歌チャートは削除されました"
    redirect_to user_path(@user_id) # 前に定義した@user_idで元のユーザーに戻るため
  end

  def print
    @user = User.find(params[:user_id])
    @song = @user.songs.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:title, :key, :body, :video, :user_id,
      :title_yomikata, :artist, :artist_yomikata)
    # videoの文字列はいnilでもいいのでそれをバリデーションに
    # そしてshowページでnilかあるかに対して上手く対応すること
  end

end
