# frozen_string_literal: true

class Job < ApplicationRecord
    self.table_name = 'jobs'
    self.primary_key = 'job_code'


    belongs_to :employer, foreign_key: :employer_code
    belongs_to :jobtag, foreign_key: :jobtag_code
end