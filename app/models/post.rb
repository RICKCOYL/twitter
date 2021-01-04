class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }
end
