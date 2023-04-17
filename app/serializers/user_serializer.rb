# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :user_code, :username, :role
end