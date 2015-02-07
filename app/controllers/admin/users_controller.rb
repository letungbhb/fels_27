class Admin::UsersController < ApplicationController
  # before_action :correct_user
  # before_action :admin_user

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end
    
  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes(user_params)
    else
      render "edit"
    end
  end

end