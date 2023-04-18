# frozen_string_literal: true

class Jobtag < ApplicationRecord
    self.table_name = 'jobtags'
    self.primary_key = 'jobtag_code'
    

    has_many :jobs
end