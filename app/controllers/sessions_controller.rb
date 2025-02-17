class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      log_in user
      remember_or_forget user
      redirect_to user
    else
      flash.now[:danger] = t "invalid_email_password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_url
  end

  def remember_or_forget user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end
end
