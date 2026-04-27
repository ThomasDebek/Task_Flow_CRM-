class Client < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :company_name, presence: true
  validates :phone, presence: true
  validates :status, presence: true

  has_many :tasks, dependent: :destroy
end
