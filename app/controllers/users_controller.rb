class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Japanese Elearning System"
      redirect_to @user
    else
      render "new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
    end
end
