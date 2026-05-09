class PolicyProposal < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :related_project, class_name: "Project", optional: true
  has_many :posts, dependent: :nullify

  STATUS_VALUES = %w[draft public submitted discussed archived]
  VISIBILITY_STATES = %w[public unlisted private]

  validates :title, presence: true
  validates :summary, presence: true
  validates :proposal, presence: true
  validates :status, inclusion: { in: STATUS_VALUES }
  validates :visibility, inclusion: { in: VISIBILITY_STATES }
end
