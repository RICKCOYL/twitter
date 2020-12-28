class User < ApplicationRecord
    validates :username,
    presence: {:message => "Please choose a username.", on: :update},
    uniqueness: {:message => "Username already exisits. Please select a different one."},
    length: {in: 3..15, :message => "Username should be 3-5 characters long", :allow_blank => true}

    has_many :posts
    has_one_attached :photo
    has_one_attached :cover_image
end
