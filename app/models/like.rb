class Like < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :article_id, uniquness: { scope: :user_id }
end
