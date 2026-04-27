class Task < ApplicationRecord

  STATUSES = %w[pending in_progress done overdue ].freeze

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  belongs_to :client


  scope :pending, -> { where(status: "pending") }
  scope :in_progress, -> { where(status: "in_progress") }
  scope :done, -> { where(status: "done") }
  scope :overdue, -> { where("due_date < ?", Date.today) }



end
