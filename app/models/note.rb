class Note < ApplicationRecord
  belongs_to :client
  validates :content, presence: true
end
