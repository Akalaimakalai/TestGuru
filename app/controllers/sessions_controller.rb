class SessionsController < ApplicationController
  def new
    return redirect_to tests_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      return redirect_to cookies[:original_url] if cookies[:original_url]
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please.'
      render :new
    end
  end

  def destroy
    cookies.delete(:original_url) if cookies[:original_url]
    cookies.delete(:email)
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_path
  end
end
