class UsersController < ApplicationController
  load_and_authorize_resource
  respond_to :js

  def new
    respond_with @user = User.new
  end

  def show
    if current_user
      respond_with current_user
    else
      render plain: 'You are guest and have not profile'
    end
  end

  def edit
    respond_with current_user if current_user
  end

  def create
    @user = User.create(user_params)
    auto_login(@user)
    respond_with(@user, location: root_path)
  end

  def update
    current_user.update(user_params)
    respond_with( current_user, location: profile_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :address, :password, :password_confirmation)
  end  

end
