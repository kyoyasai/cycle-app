class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて8文字以上で設定して下さい' }, on: :create

  with_options presence: true do
    validates :nickname, length: {maximum: 10}
  end

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes,    dependent: :destroy

  def like_judge(article)
    self.likes.exists?(article_id: article.id)
  end

  def self.guest
    find_or_create_by!(email: 'guest1@example.com', nickname: 'ゲスト') do |user|
      user.password = SecureRandom.hex(10)
    end
  end
end