class AddProfileImageIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :profile_image_id, :string
  end
end
