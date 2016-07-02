class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if user.activated? == true
        session[:user_id] = user.id
        redirect_to user
      elsif user.activated == false
        flash[:notice] = "Your account is not activated yet"
        redirect_to '/login'
      end
    else
      flash[:notice] = "Nope"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
