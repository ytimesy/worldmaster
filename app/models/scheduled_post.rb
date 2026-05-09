class ScheduledPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :posting_queue, optional: true

  STATUS_VALUES = %w[draft scheduled published failed cancelled]

  validates :user, :post, presence: true
  validates :status, inclusion: { in: STATUS_VALUES }
  validates :scheduled_at, presence: true
end
