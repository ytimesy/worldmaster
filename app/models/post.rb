class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true
  belongs_to :policy_proposal, optional: true
  belongs_to :parent_post, class_name: "Post", optional: true

  has_many :children, class_name: "Post", foreign_key: :parent_post_id, dependent: :nullify
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  POST_TYPES = %w[short_post thread project_update policy_update dev_log announcement]
  VISIBILITY_STATES = %w[public unlisted private draft]
  STATUS_STATES = %w[draft scheduled published hidden deleted]

  validates :user, presence: true
  validates :post_type, inclusion: { in: POST_TYPES }
  validates :visibility, inclusion: { in: VISIBILITY_STATES }
  validates :status, inclusion: { in: STATUS_STATES }
  validates :body, presence: true

  scope :publicly_visible, -> { where(visibility: "public", status: "published") }
  scope :scheduled, -> { where(status: "scheduled") }
  scope :drafts, -> { where(status: "draft") }
end
