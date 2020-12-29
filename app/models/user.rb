class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて8文字以上で設定して下さい' }

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ , message: 'は全角で記入してください'} do
      validates :last_name
      validates :first_name
    end
  end

  has_many :articles
  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy

  def like_judge(article)
    self.likes.exists?(article_id: article.id)
  end
end
