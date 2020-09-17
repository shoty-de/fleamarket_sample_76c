class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true

  has_one :profile
  has_many :addresses
  has_many :creditcards

  has_many :buy_products, class_name: "Product", foreign_key: "buyer_id"
  has_many :sell_products, class_name: "Product", foreign_key: "seller_id"
end
