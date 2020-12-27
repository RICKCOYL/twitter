class User < ApplicationRecord
    validates :username,
    presence: {:message => "Please choose a username.", on: :update},
    uniqueness: {:message => "Username already exisits. Please select a different one."},
    length: {in: 3..15, :message => "Username should be 3-5 characters long", :allow_blank => true}

    has_many :posts
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    has_many :followers, through: :received_follows, source: :follower
    has_many :followers, class_name: 'Following', foreign_key: 'followed_id'
    has_many :followed, class_name: 'Following', foreign_key: 'follower_id'
    has_one_attached :avatar_image
    has_one_attached :cover_image
end
