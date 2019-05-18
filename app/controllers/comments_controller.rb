class CommentsController < ApplicationController
  # create a new comment for a post
  def create
    # find the post for which to create a comment. use :post_id
    @post = Post.find(params[:post_id])
    # create a comment
    @comment = @post.comments.create(comment_params)
    # redirect to the same page of the post
    redirect_to post_path(@post)
  end

  private

  # strong parameters for comments
  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
