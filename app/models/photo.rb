class Photo < ApplicationRecord

  has_many :photo_hashtag_relations, dependent: :destroy
  has_many :hashtags, through: :photo_hashtag_relations
  belongs_to :user
  attachment :image # ここを追加（_idは含めません）

  #DBへのコミット直前に実施する
   after_create do
    photo = Photo.find_by(id: self.id)
    hashtags  = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    photo.hashtags = []
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      photo.hashtags << tag
    end
  end

  before_update do
    photo = Photo.find_by(id: self.id)
    photo.hashtags.clear
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
      photo.hashtags << tag
    end
  end
end
