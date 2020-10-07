class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :seller, class_name: "User", foreign_key: "seller_id", optional: true
  belongs_to :buyer,  class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :category
  # belongs_to :size, optonal: true
  # belongs_to :brand
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :condition
  belongs_to_active_hash :deliver_leadtime
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true

  validates :title,            presence: true
  validates :text,             presence: true
  validates :condition,        presence: true
  validates :shipping_charge,  presence: true
  validates :deliver_leadtime, presence: true
  validates :price,            presence: true
  validates :prefecture,       presence: true
  validates :product_images,   presence: true
end
