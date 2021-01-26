class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, allow_nil: true, length: { minimum: 6 }
  has_secure_password
end
