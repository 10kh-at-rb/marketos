class UsersController < ApplicationController

  def new
    respond_with @user = User.new
  end

  def create
    @user = User.create(user_params)
    auto_login(@user)
    respond_with(@user, location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end  

end
