class Article < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :prefecture_id, numericality: { other_tham: 1, message: 'Select' }
    validates :distance
    validates :content
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end