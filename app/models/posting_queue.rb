class PostingQueue < ApplicationRecord
  belongs_to :user
  has_many :posting_queue_items, dependent: :destroy
  has_many :posts, through: :posting_queue_items

  STATUS_VALUES = %w[pending running paused completed failed]

  validates :user, presence: true
  validates :title, presence: true
  validates :interval_minutes, numericality: { only_integer: true, greater_than: 0 }
  validates :status, inclusion: { in: STATUS_VALUES }
end
