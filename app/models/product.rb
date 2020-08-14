class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to_active_hash :prefecture
  has_many :product_images

  validates :title,            presence: true
  validates :text,             presence: true
  validates :condition,        presence: true
  validates :shipping_charge,  presence: true
  validates :deliver_leadtime, presence: true
  validates :price,            presence: true
end
