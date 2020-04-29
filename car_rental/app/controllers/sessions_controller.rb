class SessionsController < ApplicationController

  # login form
  def new
    # if the user is logged in he isn't allowed to go back to the login page
    redirect_to cars_path if logged_in?
  end

  # handling the login submission and make a session
  def create
    user = User.find_by(email: params[:session][:email])
    # check that the email is valid and there is a returned user so user isn't null
    # after that authenticate the password means compare it with the one stored in the database
    if user && user.authenticate(params[:session][:password])
      # save the user id in the browser session hash
      # the cookies will handel it
      session[:user_id] = user.id
      # redirect the logged user to its show page
      redirect_to cars_path
    else
      # stay in login page and let the user re-login
      render 'new'

    end
  end

  # destroy the session when logged out
  def destroy
    # remove the user id from the session hash (cookies)
    session[:user_id] = nil
    redirect_to root_path
  end
end