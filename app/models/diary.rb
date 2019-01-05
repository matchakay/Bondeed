class Diary < ApplicationRecord
  belongs_to :user
  has_many :diary_goods
  has_many :diary_comments
  validates :content, presence: true
end
