class ApplicationController < ActionController::Base
before_action :current_user 

  def require_login
    if current_user == nil
      flash["notice"] = "Please log in first."
      redirect_to "/login"
    end
  end

  def current_user
    @current_user ||= User.find_by({ "id" => session["user_id"] })
  end

  helper_method :current_user  # allows it to be used in views
end
