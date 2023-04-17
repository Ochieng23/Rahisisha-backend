# frozen_string_literal: true

class JobSerializer < ActiveModel::Serializer
  attributes :job_code, :job_name, :employer_code

  belongs_to :employer
  belongs_to :jobtag
end
