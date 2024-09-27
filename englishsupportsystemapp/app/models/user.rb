class User < ApplicationRecord
  has_many :results, through: :result_details, dependent: :restrict_with_error
end
