class User < ApplicationRecord
    validates :username,
    presence: {:message => "Please choose a username.", on: :update},
    uniqueness: {:message => "Username already exisits. Please select a different one."},
    length: {in: 3..15, :message => "Username should be 3-5 characters long", :allow_blank => true}

    has_many :posts
    has_one_attached :photo
    has_one_attached :cover_image

    #==============Association with a user that a user is following=================
    has_many :relationships, foreign_key: "user_id",dependent: :destroy
    has_many :followings, through: :relationships, source: :follow
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "follow_id",dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :user
    
    def following?(other_user)
        self.followings.include?(other_user)
      end
    
      def follow(other_user)
        unless self == other_user
          self.relationships.find_or_create_by(follow_id: other_user.id)
        end
      end
    
      def unfollow(other_user)
        relationship = self.relationships.find_by(follow_id: other_user.id)
        relationship.destroy if relationship
      end





end
