class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "ユーザを作成しました。"
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "ユーザを編集しました。"
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path, notice: "ユーザを削除しました。"
  end
  
  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
