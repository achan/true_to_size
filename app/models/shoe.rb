class Shoe < ApplicationRecord
  enum type: { men: 0, women: 1 }

  validates :name, presence: true
  validates :model, presence: true
  validates :type, presence: true
  validates :brand, presence: true
end
