class User < ApplicationRecord
  mount_uploader :avatar_path, AvatarUploader
  has_secure_password
  validates :password_digest, allow_nil: true, presence: true, confirmation: true, length: { in: 8..16 }, format: {with: /[a-zA-Z0-9]/}
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true, on: :save
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  has_many :creators
  has_many :diaries
  has_many :diary_comments
  has_many :diary_goods
  has_many :inquiries
  has_many :certifications
  has_many :creator_images
  has_many :favorites
  has_many :send_user, class_name: 'Message', :foreign_key => 'send_user_id'
  has_many :receive_user, class_name: 'Message', :foreign_key => 'receive_user_id'
  has_many :favorites, class_name: 'Favorite', :foreign_key => 'user_id'
  has_many :favorites, class_name: 'Favorite', :foreign_key => 'favorite_user_id'
  has_many :galleries
  has_many :matches, class_name: 'Match', :foreign_key => 'user_id'
  has_many :matches, class_name: 'Match', :foreign_key => 'target_user_id'
  has_many :heirs
  acts_as_tagger
end
