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

  # destroy method to delete a comment
  def destroy
    # find the post for which to delete a comment. use :post_id
    @post = Post.find(params[:post_id])
    # find the comment for a post
    @comment = @post.comments.find(params[:id])
    # delete the comment for a post
    @comment.destroy
    # redirect to the same page of the post
    redirect_to post_path(@post)
  end

  private

  # strong parameters for comments
  def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
