class User < ApplicationRecord
  has_many :results, through: :result_details, dependent: :restrict_with_error
  has_many :enrollments, dependent: :restrict_with_error
  has_many :courses, through: :enrollments

  has_secure_password

  validates :first_name, presence: true

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  validates :last_name, presence: true

  validates :username, presence: true, uniqueness: {
    message: ->(object, data) do
      " '#{data[:value]}' is already taken."
    end
  }, length: {
    maximum: 20, message: "can not exceed 20 characters."
  }

  validates :role, presence: true, inclusion: {
    in: %w[user admin]
  }

  validates :date_of_birth, presence: true

  validates :gender, inclusion: [ true, false ]

  validates :english_level, numericality: {
    only_integer: true
  }, comparison: {
    greater_than: 0, message: "can not less than 1."
  }
end
