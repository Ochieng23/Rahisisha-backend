# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes :post_code, :title, :media, :description, :likes

  belongs_to :user
  has_many :comments
  has_one :seeker
end
