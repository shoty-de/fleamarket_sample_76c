class Address < ApplicationRecord

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
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
