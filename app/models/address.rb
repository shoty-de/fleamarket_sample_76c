class Address < ApplicationRecord

  belongs_to :user, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  validates :post_family_name,        presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :post_family_name_kana,   presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :post_first_name,         presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :post_first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :postal_code,             presence: true, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id,           presence: true
  validates :city,                    presence: true
  validates :address,                 presence: true

end
