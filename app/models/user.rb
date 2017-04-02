class User < ApplicationRecord
	has_secure_password
	has_many :orders

	validates :email, uniqueness: true
	validates :password_digest, presence: true
end
