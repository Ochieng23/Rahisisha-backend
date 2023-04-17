# frozen_string_literal: true

class EmployerSerializer < ActiveModel::Serializer
  attributes :employer_code, :company_name, :email, :location, :avatar, :description, :verified
end
