# frozen_string_literal: true

class Jobtag < ApplicationRecord
    self.table_name = 'jobtags'
    self.primary_key = 'jobtag_code'
    
    #validations
    validates :jobtag_code, presence: true, length: { is: 12 }, uniqueness: true


    has_many :jobs
end