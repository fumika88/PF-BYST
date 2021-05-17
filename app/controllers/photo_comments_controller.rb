class PhotoCommentsController < ApplicationController
  def create
    @photo = Photo.find(params[:photo_id])
		@photo_comment = PhotoComment.new(photo_comment_params)
		@photo_comment.photo_id = @photo.id
		@photo_comment.user_id = current_user.id
		if @photo_comment.save
  		redirect_to photo_path(@photo.id)
		else
		  render 'photos/show'
		end
  end

  def destroy
    @photo = Photo.find(params[:photo_id])
  	photo_comment = @photo.photo_comments.find(params[:id])
		photo_comment.destroy
		redirect_to request.referer
  end

private
	def photo_comment_params
		params.require(:photo_comment).permit(:comment)

	end

end
