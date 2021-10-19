class SessionsController < ApplicationController
  

  def new
    redirect_to user_path(current_user) if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "You are Logged In"
      redirect_to user_path(user)
    else
      flash.now[:notice] = "Email and Password did not matched"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You been logged out"
    redirect_to root_path
  end
end