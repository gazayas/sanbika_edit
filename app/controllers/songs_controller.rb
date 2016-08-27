class SongsController < ApplicationController

  before_filter :authorize, :only => [:new, :edit]

  def index
    @users = User.all
    @songs = Song.all
  end

  def show
    @user = User.find(params[:user_id])
    @song = @user.songs.find(params[:id]) # 複数形にした方がいいかな
  end

  def new
    @user = User.find(params[:user_id])
    @song = @user.songs.build
    @panel_heading = "賛美歌チャートの新規作成"
  end

  def create
    @user = User.find(params[:user_id])
    @song = @user.songs.create(song_params)
    if @song.save
      flash[:success] = "新しい賛美歌チャートを作成しました"
      redirect_to :action => "show", :id => @song.id
    else
      flash.now[:danger] = "歌は保存されませんでした"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @song = @user.songs.find(params[:id])
    @panel_heading = "賛美歌チャートの編集"
  end

  def update
    @user = User.find(params[:user_id])
    @song = @user.songs.find(params[:id])
    if @song.update_attributes(song_params)
      flash[:success] = "賛美歌チャートは編集されました"
      redirect_to user_song_path(@user, @song)
    else
      redirect_to user_song_path(@user, @song)
      flash[:danger] = "賛美歌チャートは保存されませんでした" # これの代わりにエラーのメッセージを表示すること
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

  def search
    @song_search = Song.search(params[:search])
  end

  private
  def song_params
    params.require(:song).permit(:title, :key, :body, :video, :user_id,
      :title_yomikata, :artist, :artist_yomikata)
    # videoの文字列はいnilでもいいのでそれをバリデーションに
    # そしてshowページでnilかあるかに対して上手く対応すること
  end

end
