class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["email"] = params["email"]
    @user["password_digest"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/"
  end
end
