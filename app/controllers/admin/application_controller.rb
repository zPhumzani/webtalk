class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin

  def index
  end

  private
  def authorize_admin
  	authenticate_user!

  	if current_user.admin?
  		flash[:notice] = "Welcome master"
  	else
  		flash[:alert] = "Error"
  		redirect_to root_path
  	end
  end
end
