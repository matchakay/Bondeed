class Match < ApplicationRecord
  belongs_to :user, class_name: 'User', :foreign_key => 'user_id'
  belongs_to :target_user, class_name: 'User', :foreign_key => 'target_user_id'
  validates :user_id, :uniqueness => {:scope => :target_user_id}
end
