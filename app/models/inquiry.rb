class Inquiry < ApplicationRecord
  has_many :inquiry_categories
  belongs_to :user
end
