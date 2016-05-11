class PostsController < ApplicationController

  def show
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end

private
  def post_params
    params.require(:post).permit(:console, :gamertag, :game, :description, :language, :mic)
  end

end
