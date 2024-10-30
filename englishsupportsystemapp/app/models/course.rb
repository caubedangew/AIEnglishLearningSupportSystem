class Course < ApplicationRecord
  has_many :lessons, dependent: :restrict_with_error
  has_many :enrollments, dependent: :restrict_with_error
  has_many :users, through: :enrollments

  validates :name, uniqueness: {
    message: ->(object, data) do
      " '#{data[:value]}' is already taken."
    end
  }, presence: true, length: {
    maximum: 50, too_long: "can not exceed 50 characters."
  }

  validates :description, length: {
    maximum: 255, too_long: "can not exceed 255 characters."
  }

  validates :level, comparison: {
    greater_than: 0, message: "can not less than 1."
  }
end
