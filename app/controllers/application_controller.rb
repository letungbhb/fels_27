class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "U dont have right to access this page.Please log in."
        redirect_to login_url
    end
  end
  
  def correct_user
    @user = User.find params[:id]
    if current_user.id != @user.id
      flash[:danger] = "U dont have right to access this page.Please log in."
      redirect_to root_url
    end
  end

  def correct_supervisor
    if !current_user.is_supervisor?
      flash[:danger] = "U are not admin.U dont have right to access this page."
      redirect_to root_url
      end
    end
end