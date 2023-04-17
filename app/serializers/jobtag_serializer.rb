# frozen_string_literal: true

class JobtagSerializer < ActiveModel::Serializer
  attributes :jobtag_code, :group_name
end