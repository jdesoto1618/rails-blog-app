class PostsController < ApplicationController
  # index method for all posts page
  def index

  end

  def new

  end

  def create
    # Post.new references the model. post_params references private method
    @post = Post.new(post_params)
    # save a new post once it's created
    @post.save
    # show the new post after it's created and saved
    redirect_to @post
  end

  def show
    # show a post after it's created. pass in the id of the post from the url
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
