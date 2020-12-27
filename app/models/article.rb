class Article < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :prefecture_id, numericality: { other_tham: 1, message: 'Select' }
    validates :distance
    validates :content
  end

  belongs_to :user
  has_many   :comments, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def self.search(search)
    if search != ""
      Article.where('title LIKE(?)', "%#{search}%")
    else
      Article.all
    end
  end
end