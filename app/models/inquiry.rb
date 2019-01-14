class Inquiry < ApplicationRecord
  has_many :inquiry_categories
  belongs_to :user
  validates :content, presence: true
  validates :user_id, allow_nil: true, presence: false
  validates :inquiry_category_id, presence: true
end
