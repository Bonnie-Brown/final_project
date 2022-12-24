class User < ApplicationRecord
    has_secure_password

    has_many :trips, dependent: :destroy

    has_many :accommodations, dependent: :destroy
    has_many :transportations, dependent: :destroy

    has_many :todo_lists, dependent: :destroy
    has_many :todo_items, dependent: :destroy

    # Validations 

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX

end
