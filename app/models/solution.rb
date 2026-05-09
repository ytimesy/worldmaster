class Solution < ApplicationRecord
  has_many :evaluations, dependent: :destroy

  validates :title, presence: true
  validates :category, presence: true
  validates :summary, presence: true
end
