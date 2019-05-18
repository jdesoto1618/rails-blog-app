class Comment < ApplicationRecord
  # a comment belongs to a post, set the relationship here and in the post model
  belongs_to :post
end
