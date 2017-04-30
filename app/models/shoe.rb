class Shoe < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  attr_accessor :slug

  enum size_class: { men: 0, women: 1 }

  validates :name, presence: true
  validates :model, presence: true
  validates :size_class, presence: true
  validates :brand, presence: true

  def slug_candidates
    [
      :name,
      [:name, :model]
    ]
  end
end
