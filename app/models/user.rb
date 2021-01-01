class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }

  has_many :posts, dependent: :destroy
  has_one_attached :photo
  has_one_attached :cover_image

  #==============Association with a user that a user is following=================
  has_many :relationships, foreign_key: 'user_id', dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  scope :all_except, ->(user) { where.not(id: user) }
  scope :all_not_followed, ->(user) { User.all_except(user.followings).where.not(id: user) }

  def following?(other_user)
    followings.include?(other_user)
  end

  def follow(other_user)
    relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship&.destroy
  end
end
