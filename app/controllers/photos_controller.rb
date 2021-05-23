class PhotosController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @photos = @tag.photos
  end

  def ranking
    @photos = Photo.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
  end

  def category
    @category = Category.find_by(params[:id])
    #@category = Category.find_by(category_id: params[:id])
    #@photo = Photo.find_by(params[:id])
    #@photos = Photo.where(category_id: params[:id]).order('created_at DESC')
    @photos = @category.photos

  end

  def new
    @photo = Photo.new

  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
    redirect_to photos_path, notice: "You have created book successfully."
    else render "new"
    end
  end

  def index
    @photos = Photo.all
    @photo = Photo.find_by(params[:id])
    #必要ないかも
    @category = Category.find_by(params[:category_id])
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @photos = @category.photos
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @user = current_user
    @photo_comment = PhotoComment.new #追加
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

   private

  def photo_params
    params.require(:photo).permit(:name, :image, :caption, :profile_image, :category_id)
  end

end
