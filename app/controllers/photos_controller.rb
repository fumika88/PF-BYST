class PhotosController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def hashtag
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:name])
    @photos = @tag.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    @photo.save
    redirect_to photos_path
  end

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
    @user = current_user
  end

  def destroy
    #@user = current_user
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_path
  end

   private

  def photo_params
    params.require(:photo).permit(:name, :image, :caption, :profile_image)
  end

end
