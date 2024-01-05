class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the drive, #{@user.name}!"
      redirect_to uploaded_files_path
    else
      render :new, errors: @user.errors.full_messages
    end
  end

  def start
    
  end
  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
