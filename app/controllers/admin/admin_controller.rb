class Admin::AdminController < ApplicationController
  private
  def correct_supervisor
    return if logged_in? && current_user.is_supervisor?
    flash[:danger] = "U dont have permission to access this page."
    redirect_to root_url
  end
end
