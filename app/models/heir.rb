class Heir < ApplicationRecord
  has_many :art_categories
  belongs_to :user
end
