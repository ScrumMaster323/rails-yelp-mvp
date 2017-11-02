class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # remove the reviews if I remove a restaurant

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian", "burger"], allow_nil: false }
  validates :address, presence: true
end
