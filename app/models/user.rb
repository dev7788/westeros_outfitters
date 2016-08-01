class User < ActiveRecord::Base
  has_secure_password

  has_many :orders

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :email,    presence: true, uniqueness: true
  validates :address,  presence: true
  validates :role,     presence: true

  enum role: %w(default admin)
end
