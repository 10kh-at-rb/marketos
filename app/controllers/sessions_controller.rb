class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:name], params[:password])
    if user
      if user.admin
        redirect_to admin_path
      else
        redirect_to root_path
      end
    else
      flash.now.alert = t(:invalid_email_or_password)
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end