class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, length: { in: 3..15}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
    validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
    
    has_many :topics
    has_many :favorites
    has_many :favorite_topics, through: :favorites, source:'topic'
    
end
