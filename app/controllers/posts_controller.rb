class PostsController < ApplicationController


  def index
    @posts = Post.all.limit(25)
    @post = Post.new
    if request.xhr?
      render '_posts', layout: false
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create

  end

  private
  def post_params
    params.require(:post).permit(:console, :gamertag, :game, :description, :language, :microphone)
  end

end
