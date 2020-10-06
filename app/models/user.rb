class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]/
  FULL_WIDTH_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname
    validates :first_name, :last_name, format: { with: FULL_WIDTH_REGEX, message: "Full-width characters"}
    validates :first_name_kana, :last_name_kana, format: { with: FULL_WIDTH_KANA_REGEX, message: "Full-width katakana characters"}
    validates :birthday
  end
end
