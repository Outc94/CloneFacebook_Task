class User < ApplicationRecord
  validates :firstname,  presence: true, length: { maximum: 30 }
  validates :lastname,  presence: true, length: { maximum: 30 }
  validates :email, uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :posts
end
