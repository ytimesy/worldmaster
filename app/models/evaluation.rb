class Evaluation < ApplicationRecord
  belongs_to :solution

  validates :result, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
end
