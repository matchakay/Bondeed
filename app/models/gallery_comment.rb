class GalleryComment < ApplicationRecord
  belongs_to :gallery
  belongs_to :user
  validates :comment, presence: true
end
