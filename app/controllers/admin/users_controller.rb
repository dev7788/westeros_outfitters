class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
    if @user.id.to_s == params[:id]
      render :edit
    else
      render file: "app/views/errors/not_found.html.erb"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_dashboard_path
    else
      flash[:error] = 'Please Fill Out All Fields'
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:username, :password, :address, :email)
  end
end
