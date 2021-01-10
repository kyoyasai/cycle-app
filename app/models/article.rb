class Article < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :distance
    validates :content
  end

  belongs_to :user
  has_many   :comments, dependent: :destroy
  has_many   :likes,    dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def self.search(search)
    if search != ""
      Article.where('title LIKE(?) OR content LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Article.all
    end
  end
end