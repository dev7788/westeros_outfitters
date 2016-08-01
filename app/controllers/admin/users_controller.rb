class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
    require_admin
    # if current_user == @user
    #   render :edit
    # else
    #   render file: '/public/404'
    # end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_dashboard_path
    else
      flash[:error] = 'Please Fill Out All Fields'
      render request.referrer
    end
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :address, :email)
  end
end
