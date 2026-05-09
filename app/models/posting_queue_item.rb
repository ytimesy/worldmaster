class PostingQueueItem < ApplicationRecord
  belongs_to :posting_queue
  belongs_to :post

  STATUS_VALUES = %w[pending scheduled published failed cancelled]

  validates :posting_queue, :post, presence: true
  validates :position, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: STATUS_VALUES }
end
