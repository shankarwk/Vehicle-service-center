class UserCrudController < ApplicationController
  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    @user.save
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def edit
    @data = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user  = User.new
  end

  private
  def user_params
      params.require(:user).permit(:user_rule,:user_rule,:password)
  end 
end
