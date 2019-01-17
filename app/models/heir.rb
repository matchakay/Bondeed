class Heir < ApplicationRecord
  has_many :art_categories
  belongs_to :user
  validates :art_category_id, presence: {message: "を選択してください"}
end
