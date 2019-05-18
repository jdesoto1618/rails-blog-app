class Post < ApplicationRecord
  # a post can have many comments, link comments and posts here
  has_many :comments
  # sets form validation conditions for post titles
  validates :title, presence: true, length: {minimum: 3}
  # sets form validation conditions for posts
  validates :body, presence: true
end
