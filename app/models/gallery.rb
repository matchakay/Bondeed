class Gallery < ApplicationRecord
  mount_uploader :data, GalleryUploader
  has_secure_token :id
  belongs_to :user
  validates :comment, presence: true, length: {minimum: 1}
  validates :data, presence: true
  acts_as_taggable
end
