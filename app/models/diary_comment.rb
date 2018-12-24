class DiaryComment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :diary
  belongs_to :user
end
