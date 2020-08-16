class Address < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :post_family_name,        presence: true
  validates :post_family_name_kana,   presence: true
  validates :post_personal_name,      presence: true
  validates :post_personal_name_kana, presence: true
  validates :postal_code,             presence: true
  validates :prefecture_id,           presence: true
  validates :city,                    presence: true
  validates :address,                 presence: true
end
