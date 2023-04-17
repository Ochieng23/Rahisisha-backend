# frozen_string_literal: true

class Post < ApplicationRecord
    self.table_name = 'posts'
    self.primary_key = 'post_code'

    #validations
    validates :title, presence: true, length: { maximum: 100 }
    validates :media, presence: true
    validates :description, presence: true, length: { maximum: 1000 }
    validates :user_code, presence: true

    belongs_to :user, foreign_key: :user_code
    has_many :comments, foreign_key: :post_code
end