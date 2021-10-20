class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates :description, presence: true
end
