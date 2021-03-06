class CreatePhotoHashtagRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :photo_hashtag_relations do |t|

      t.references :photo, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
