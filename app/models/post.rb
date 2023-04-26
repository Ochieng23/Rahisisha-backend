# frozen_string_literal: true

class Post < ApplicationRecord
    self.table_name = 'posts'
    self.primary_key = 'post_code'
    

    belongs_to :user, foreign_key: :user_code
    has_many :comments, foreign_key: :post_code
    has_one :seeker, through: :user
end