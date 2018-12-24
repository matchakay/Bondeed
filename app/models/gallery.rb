class Gallery < ApplicationRecord
  mount_uploader :data, GalleryUploader
  belongs_to :user
  acts_as_taggable
end
