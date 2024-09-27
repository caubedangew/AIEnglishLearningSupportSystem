class Lesson < ApplicationRecord
  belongs_to :course

  validates :name, presence: true, length: {
    maximum: 255, too_long: "can not exceed 255 characters."
  }

  validates :content, presence: true

  validates :course_id, comparison: {
    greater_than: 0, message: "can not be blank"
  }
end
