class ApplicationController < ActionController::Base

  def current_user
    @current_user = User.find_by({"id"=> session["user_id"]})
  end

  helper_method :current_user  # allows it to be used in views
end
