class PostsController < ApplicationController
  # index method for all posts page
  def index
    @posts = Post.all
  end

  # use this method for instance variables to be passed to the new view
  def new
    @post = Post.new
  end

  def create
    # Post.new references the model. post_params references private method
    @post = Post.new(post_params)
    # save a new post once it's created. this goes along with form validations in the model
    if(@post.save)
      # show the new post after it's created and saved
      redirect_to @post
    else
      # if form validations do not pass, render the new view again
      render 'new'
    end
  end

  def show
    # show a post after it's created. pass in the id of the post from the url
    @post = Post.find(params[:id])
  end

  # this method will bring in post values and allow editing
  def edit
    @post = Post.find(params[:id])
  end

  # method to save updates to a post once it has been edited
  def update
    @post = Post.find(params[:id])
    # update a post and bring in previous post values
    if(@post.update(post_params))
      # show the edited post after it's successfully updated
      redirect_to @post
    else
      # if form validations do not pass, render the edit view again
      render 'edit'
    end
  end

  # method to delete a post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
