# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  has_one :employer, foreign_key: :user_code
  has_one :seeker, foreign_key: :user_code
  has_one :admin, foreign_key: :user_code
  has_many :posts, foreign_key: :user_code
  attributes :user_code, :username, :role   
end