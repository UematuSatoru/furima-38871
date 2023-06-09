class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  with_options presence: true do
   validates :nickname
   validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'is invalid. Input full-width characters' }
   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'is invalid. Input full-width characters' }
   validates :last_kana,
             format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
   validates :first_kana,
             format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
   validates :birth_date


  end
 end
 
