# frozen_string_literal: true

class Job < ApplicationRecord
    self.table_name = 'jobs'
    self.primary_key = 'job_code'

#validations
    validates :job_name, presence: true
    validates :jobtag_code, presence: true
    validates :employer_code, presence: true

    belongs_to :employer, foreign_key: :employer_code
    belongs_to :jobtag, foreign_key: :jobtag_code
end