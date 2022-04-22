class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
  end

  validates :password, format: { with: /\A[a-z0-9]+\z/i }, allow_nil: true
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
  validates :family_name, presence: true
  validates :first_name, presence: true
  end
 
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
  validates :family_name_kana, presence: true
  validates :first_name_kana, presence: true
  end

end
