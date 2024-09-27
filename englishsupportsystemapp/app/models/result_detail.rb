class ResultDetail < ApplicationRecord
  belongs_to :result

  validates :score, comparision: {
    greater_than: 0, message: "can not less than 0"
  }

  validates :time, comparision: {
    greater_than: 0, message: "can not less than 0"
  }
end
