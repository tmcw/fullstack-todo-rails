class Task < ApplicationRecord
  default_scope { order(created_at: :desc) }
  scope :active, -> { where(done: false).order(created_at: :desc) }
  scope :completed, -> { where(done: true).order(created_at: :desc) }

  validates :name, :presence, length: { maximum: 120 }
end
