class User < ApplicationRecord
    has_many :games
    has_many :categories, through: :games 
    has_secure_password
    # validates :username, uniqueness: { case_sensitive: false }
    # validates :username, uniqueness: true
    # validates :username, presence: true
    # validates :username, length: { minimum: 4 }
    # validates :password, presence: true, confirmation: true, if: :password_required?
    # add more validations for password etc....
end
