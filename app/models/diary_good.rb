class DiaryGood < ApplicationRecord
  #組み合わせユニーク
  validates :user_id, :uniqueness => {:scope => :diary_id}
  validates :user_id, presence: true
  validates :diary_id, presence: true
  belongs_to :diary
  belongs_to :user
end
