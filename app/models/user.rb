class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
  has_secure_password
end
