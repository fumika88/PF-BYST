class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    #pageメソッドを利用して、すべての投稿画像が表示されないように設定
    @photos = @user.photos.page(params[:page]).reverse_order
    #@photos = @user.photos
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
       render "edit"
    end
  end

  private

  def user_params
     params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
