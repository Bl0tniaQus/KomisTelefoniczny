class User < ApplicationRecord
	has_many :telefons
	validates :login, presence: true, uniqueness: true
	validates :password, presence: true
end
