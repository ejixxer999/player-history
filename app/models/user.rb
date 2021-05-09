class User < ApplicationRecord
    has_secure_password
    has_many :teams
    has_many :cities, through: :teams
    validates :username, presence: true, uniqueness: true
end
