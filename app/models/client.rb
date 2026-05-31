class Client < ApplicationRecord
  belongs_to :user

  include PgSearch::Model

  validates :name, presence: true
  validates :email, presence: true
  validates :company_name, presence: true
  validates :phone, presence: true
  validates :status, presence: true

  has_many :tasks, dependent: :destroy
  has_many :notes, dependent: :destroy

  pg_search_scope :search,
                  against: [:name, :email, :phone, :company_name],
                  using: {
                    tsearch: {
                      prefix: true
                    }
                  }
end
