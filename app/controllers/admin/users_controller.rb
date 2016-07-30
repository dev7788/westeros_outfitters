class Admin::UsersController < Admin::BaseController
  before_action :current_user

  def show
    @user = User.find(current_user.id)
  end

  def edit
    binding.pry
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to admin_dashboard_path
  end


  private


  def user_params
    params.require(:user).permit(:username,:password,:address,:email)
  end



end
