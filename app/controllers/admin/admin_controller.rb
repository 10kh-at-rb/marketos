class Admin::AdminController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_admin
  respond_to :html
  layout '/admin/layouts/admin'
  private

  def check_admin
    if  !current_user || !current_user.admin
      redirect_to login_path, notice: 'You are not admin'
    end
  end

end