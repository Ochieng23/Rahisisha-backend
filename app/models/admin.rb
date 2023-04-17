# frozen_string_literal: true

class Admin < ApplicationRecord
    # declarations
    self.table_name = 'admins'
    self.primary_key = 'admin_code'
    # validations
    validates :admin_code, presence: true, uniqueness: true, length: { is: 12 }
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :user_code, presence: true, uniqueness: true
    
    # relations
    belongs_to :user, foreign_key: :user_code
end