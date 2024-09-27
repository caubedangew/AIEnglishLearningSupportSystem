class Exercise < ApplicationRecord
  belongs_to :lesson

  has_many :questions, dependent: :restrict_with_error
  has_many :users, dependent: :restrict_with_error

  validates :name, presence: true, length: {
    maximum: 255, too_long: "can not exceed 255 characters"
  }

  validates :type, inclusion: {
    in: %w(multiple_choice blank_filling translating reading speaking),
    message: "is not a valid choice."
  }

  validates :lesson_id, presence: true, comparison: {
    greater_than: 0, message: "can not be blank."
  }
end
