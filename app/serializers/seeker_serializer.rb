# frozen_string_literal: true

class SeekerSerializer < ActiveModel::Serializer
  attributes :seeker_code, :full_name, :email, :location, :gender, :date_of_birth, :avatar, :phone_number, :preferred_job, :availability, :minimum_salary, :verified
end
