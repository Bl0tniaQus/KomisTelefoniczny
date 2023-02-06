class User < ApplicationRecord
	has_many :telefon
	validates :login, presence: true, uniqueness: true
	validates :password, presence: true
end
