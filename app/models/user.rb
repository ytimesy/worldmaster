class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :projects, foreign_key: :owner_id, dependent: :destroy
  has_many :policy_proposals, foreign_key: :owner_id, dependent: :destroy
  has_many :scheduled_posts, dependent: :destroy
  has_many :posting_queues, dependent: :destroy
  has_many :reports, foreign_key: :reporter_id, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :display_name, presence: true
  validates :role, inclusion: { in: %w[guest user moderator admin] }
end
