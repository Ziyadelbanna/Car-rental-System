class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?



  def current_user
    # if the current user already with us return it
    # if not (||=) go and search for it in the database
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # returns true if we have a current user
  def logged_in?
    # !! turns the object which is current_user to boolean
    !!current_user
  end

  # actions need the user to be logged in like logout
  def require_user
    if !logged_in?
      #flash[:danger] = 'You must be logged in to perform that action'
      redirect_to root_path
    end
  end


end
