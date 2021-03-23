class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new]

  def new 
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def create_with_twitter
    user = User.find_or_create_by(email: auth['info']['email']) do |u|
      u.username = auth['info']['nickname']
      u.password = SecureRandom.hex(8)
    end
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully with Twitter"
    else
      flash[:alert] = "Erro with logging in with Twitter"
      render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to signin_path, notice: "Logged out"
  end
end

private

def redirect_if_logged_in
  if current_user
    redirect_to cocktails_path
  end
end

def auth 
  request.env['omniauth.auth']
end