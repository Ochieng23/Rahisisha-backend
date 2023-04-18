# frozen_string_literal: true

class User < ApplicationRecord
    has_secure_password

    self.table_name = 'users'
    self.primary_key = 'user_code'

    # validations
    validates :role, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, length:{minimum: 6}

    # relations
    has_one :employer, foreign_key: :user_code
    has_one :seeker, foreign_key: :user_code
    has_one :admin, foreign_key: :user_code

    has_many :posts
    has_many :comments
end