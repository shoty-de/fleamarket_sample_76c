class Profile < ApplicationRecord
  belongs_to :user

  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :family_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birthday, presence: true
  validates :birthmonth, presence: true
  validates :birthyear, presence: true

end
