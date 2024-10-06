class Question < ApplicationRecord
  belongs_to :exercise

  has_many :answers, dependent: :restrict_with_error

  validates :name, presence: true, length: {
    maximum: 255, too_long: "can not exceed 255 characters."
  }
end
