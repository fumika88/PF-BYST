class PhotoHashtagRelation < ApplicationRecord

  belongs_to :photo
  belongs_to :hashtag
  with_options presence: true do

   validates :photo_id
   validates :hashtag_id
  end

end
