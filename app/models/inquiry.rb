class Inquiry < ApplicationRecord
  has_many :inquiry_categories
  belongs_to :user, optional: true
  validates :content, presence: true
  validates :inquiry_category_id, presence: {message: "を選択してください"}
end
