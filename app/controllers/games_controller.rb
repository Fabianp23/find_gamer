class GamesController < ApplicationController
   before_action :set_game, only: [:show]


  def index
   render :layout => 'welcome'
  end
  def show
    @posts = @game.posts
  end


  private

  def set_game
    @game = Game.find_by_name(params[:name])
  end

end
