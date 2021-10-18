class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :description, presence: true
  validates :user_id, presence: true
end
