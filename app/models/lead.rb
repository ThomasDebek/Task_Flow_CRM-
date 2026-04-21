class Lead < ApplicationRecord
  STATUSES = %w[new contacted qualified lost].freeze

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  scope :new_leads, -> { where(status: "new") }
  scope :contacted, -> { where(status: "contacted") }
  scope :qualified, -> { where(status: "qualified") }
  scope :lost, -> { where(status: "lost") }



  def full_name
    "#{first_name} #{last_name}"
  end

  def next_status
    case status
    when "new"
      "contacted"
    when "contacted"
      "qualified"
    else
      nil
    end
  end

  def can_advance?
    next_status.present?
  end
end
