class AddCategoryIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :category_id, :integer
  end
end
