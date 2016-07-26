class User < ActiveRecord::Base

has_many :orders

validates :username, presence: true,
                   uniqueness: true
validates :password, presence: true

has_secure_password

enum role: ["default", "admin"]


end
