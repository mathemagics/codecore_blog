class UsersController < ApplicationController

  before_action :get_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params(params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update user_params

    else

    end
  end


  def user_params(params)
  params.require(:user).permit([  :first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation])
  end

  def get_user
    @user   = User.find(params[:id])
  end

end
