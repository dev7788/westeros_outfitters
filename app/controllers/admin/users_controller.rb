class Admin::UsersController < Admin::BaseController
  before_filter :current_user

  def show
    @user = User.find(current_user.id)
  end

end
