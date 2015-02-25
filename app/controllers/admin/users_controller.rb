class Admin::UsersController < Admin::AdminController
  before_action :correct_supervisor,   only: [:edit, :update, :index, :show ]

  def index
    @users = User.normal_users.paginate page: params[:page], :per_page => 10
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
      flash[:success]= "User profile updated"
      redirect_to admin_user_url(@user.id)
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
  end
end