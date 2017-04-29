class User < ApplicationRecord
  has_secure_password
  enum status: { admin: 0, user: 1, banned: 2 }

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[a-zA-Z0-9]+\Z/ }

  validate :immutable_fields_unchanged, on: :update

  validates :password, presence: true
  validates :shoe_size, presence: true

  before_create :assign_user_status

  private

  def assign_user_status
    self.status = :user
  end

  def immutable_fields_unchanged
    errors.add(:username, "can't be updated") if self.username_changed?
    errors.add(:status, "can't be updated") if self.status_changed?
  end
end
