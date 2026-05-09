class Project < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :posts, dependent: :nullify
  has_many :policy_proposals, foreign_key: :related_project_id, dependent: :nullify

  STATUS_VALUES = %w[idea building demo active paused archived]
  VISIBILITY_STATES = %w[public unlisted private]

  validates :title, presence: true
  validates :summary, presence: true
  validates :status, inclusion: { in: STATUS_VALUES }
  validates :visibility, inclusion: { in: VISIBILITY_STATES }
end
