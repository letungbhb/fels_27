class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show, :index]
  before_action :correct_user,   only: [:edit, :update]
  
  def index
  end

  def new
    @user=User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Register success,Welcome to the Japanese Elearning System"
      redirect_to login_path
    else
      render "new"
    end
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params
      flash[:success]="profile updated"
      redirect_to @user
    else
      render "edit"
    end
  end

end
