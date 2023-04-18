# frozen_string_literal: true

class Comment < ApplicationRecord
    self.table_name = 'comments'
    self.primary_key = 'comment_code'

    # validations
    validates :content, length: { minimum: 2 }


    belongs_to :post, foreign_key: :post_code
    belongs_to :user, foreign_key: :user_code
end