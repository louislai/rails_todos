class SessionsController < ApplicationController
  def new
    redirect_to current_user if logged_in?
  end

  def create
    user = User.where('lower(email) = ?', params[:session][:email].downcase).first
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user_tasks_path(user_id: session[:user_id])
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
