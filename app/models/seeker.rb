# frozen_string_literal: true

class Seeker < ApplicationRecord
    self.table_name = 'seekers'
    self.primary_key = 'seeker_code'

    # validations
    validates :full_name, presence: true
    validates :email, presence: true
    # validates :phone_number, length: { in: 9..12  }
    # validates :gender, inclusion: { in:  ['Male', 'Female']  }

    # relations
    belongs_to :user, foreign_key: :user_code
end