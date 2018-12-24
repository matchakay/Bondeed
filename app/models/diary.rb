class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_goods
  has_many :diary_comments
  has_many :diary_media
  accepts_nested_attributes_for :diary_media
  validates :content, presence: true
end
