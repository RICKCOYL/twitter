class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { is: 10 }
end
