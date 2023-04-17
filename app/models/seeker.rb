# frozen_string_literal: true

class Seeker < ApplicationRecord
    self.table_name = 'seekers'
    self.primary_key = 'seeker_code'

    # validations
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true

    # relations
    belongs_to :user, foreign_key: :user_code
end