class SessionsController < ApplicationController

  def new
  end

  def create
    user = login(params[:name], params[:password])
    if user
      redirect_to root_path
    else
      flash.now.alert = "Email or password are invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end