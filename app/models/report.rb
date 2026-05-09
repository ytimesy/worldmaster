class Report < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :post

  STATUS_VALUES = %w[pending reviewed resolved rejected]

  validates :reporter, :post, :reason, presence: true
  validates :status, inclusion: { in: STATUS_VALUES }
end
