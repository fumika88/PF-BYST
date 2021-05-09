class FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    favorite = @photo.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
    favorite = @photo.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end
end
