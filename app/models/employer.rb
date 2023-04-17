# frozen_string_literal: true

class Employer < ApplicationRecord
    self.table_name = 'employers'
    self.primary_key = 'employer_code'

    # validations
    #validates :employer_code, presence: true, uniqueness: true, length: { is: 12 }
    validates :company_name, presence: true
    validates :email, presence: true, uniqueness: true

    # relations
    belongs_to :user, foreign_key: :user_code
    has_many :jobs
end