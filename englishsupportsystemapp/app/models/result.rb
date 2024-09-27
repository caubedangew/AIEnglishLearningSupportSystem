class Result < ApplicationRecord
  belongs_to :exercise
  belongs_to :user

  has_many :result_details, through: :restrict_with_error, dependent: :restrict_with_error

end
