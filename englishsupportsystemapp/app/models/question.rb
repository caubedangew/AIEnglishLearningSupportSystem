class Question < ApplicationRecord
  belongs_to :exercise

  has_many :questions, dependent: :restrict_with_error
end
