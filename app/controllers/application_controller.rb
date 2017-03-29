class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]

    # The above code is equivalent to:
    # if session[user_id]
    # 	@current_user = User.find_by(id: session[:user_id])
    # else
    # 	@current_user = false
    # end   
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def categories # this is what is called, in our application.html.erb on line # 60.
    @categories = Category.all
  end
  helper_method :categories # this is what allows us to actually call the method. if it is named differently than
                            # the method on line # 22, we will get an error.
end
