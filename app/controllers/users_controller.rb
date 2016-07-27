class UsersController < ApplicationController

  def show
    @user= User.find(current_user.id)
  end

  def new
    @user = User.new
    render :layout => false
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:notice]= 'Account successfully created!'
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error]= 'Those are not valid inputs.'
      render :new
    end
  end



private

  def user_params
    params.require(:user).permit(:username,:password, :address,:email)
  end

end
