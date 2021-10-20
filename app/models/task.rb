class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user
  validates :description, presence: true
  validates :user_id, presence: true
  VALID_DATE_REGEX = /\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])*/
  validates :date, presence: true, 
            format: { with: VALID_DATE_REGEX }
end
