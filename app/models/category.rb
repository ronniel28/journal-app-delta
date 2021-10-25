class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates :description, presence: true, length: {minimum: 3, maximum: 30}
end
