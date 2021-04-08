class User < ApplicationRecord
    has_many :games
    has_many :categories, through: :games 
    has_secure_password
end
