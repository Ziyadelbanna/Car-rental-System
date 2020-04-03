class SessionsController < ApplicationController
  def create
    user = User.find_by_email(login_params[:email])
    if user && user.password_hash == BCrypt::Engine.hash_secret(login_params[:password], BCrypt::Engine.generate_salt)
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to 'cars', :notice => "Logged out!"
  end

  private
  def login_params
    params.require(:login).permit(:email,:password)
  end
end
