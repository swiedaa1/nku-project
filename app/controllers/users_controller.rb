class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      session[:user_id] = @users.id
      redirect_to root_path, alert: "Successfully Created User"
    else
      render 'new'
    end
  end

  def edit
    @users = User.find(params[:id])
  end
 
  def update
    @users = User.find(params[:id])
    if @users.update(user_params)
      redirect_to root_path, alert: "Successfully updated User"
    else
      render 'edit'
    end
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
