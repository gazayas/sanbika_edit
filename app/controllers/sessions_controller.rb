class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      if user.activated? == true
        session[:user_id] = user.id
        redirect_to user
      elsif user.activated == false
        flash[:notice] = "アカウントは登録されていますが、まだアクティベートされていません。メールをご確認ください。"
        redirect_to '/login'
      end
    else
      flash[:notice] = "ログインできませんでした"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
