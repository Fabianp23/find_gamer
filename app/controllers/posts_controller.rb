class PostsController < ApplicationController


  def index
    @posts = Post.all.limit(30)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
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
    end
  end

  private
  def post_params
    params.require(:post).permit(:console, :gamertag, :game, :description, :language, :microphone)
  end

end
