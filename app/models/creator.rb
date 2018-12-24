class Creator < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :category_id, presence: true
  validates :establishment, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 500}
  validates :employee, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :postal_code, presence: true, numericality: true, length: { is: 7 }
  validates :address_1, presence: true
  validates :address_2,  presence: true
  has_many :art_categories
  belongs_to :user
end
