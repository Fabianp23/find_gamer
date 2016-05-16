class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @response = HTTParty.get("https://www.igdb.com/api/v1/games/search/?q=#{params["game"]}")
    @post = Post.create(post_params)
    respond_to do |format|
      if @post.save
          format.js { }
      else
        render :new
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:console, :gamertag, :game, :description, :language, :microphone)
  end

end
