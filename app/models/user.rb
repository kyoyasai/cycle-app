class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて8文字以上で設定して下さい' }

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
  end
end
