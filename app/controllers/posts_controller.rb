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
<<<<<<< HEAD
    @response = HTTParty.get("https://www.igdb.com/api/v1/games/search/?q=#{params["game"]}")
    @post = Post.create(post_params)
    respond_to do |format|
      if @post.save
          format.js {}
      else
        render :new
      end
=======
    @post = Post.create!(post_params)
    # respond_to do |format|
    #   if @post.save
    #       format.js {}
    #   else
    #     render :new
    #   end
    # end
    if request.xhr?
      render '_post', layout: false, locals: { post: @post }
>>>>>>> 408c8b78e19bd4bc40e71732101d2c14b8221a8d
    end
  end

  private
  def post_params
    params.require(:post).permit(:console, :gamertag, :game, :description, :language, :microphone)
  end

end
