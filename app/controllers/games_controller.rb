class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def show
    @posts = @game.posts
  end


  private

  def set_game
    # if params[:name]
   #    @game = Game.find_by_name(params[:name])
   #  elsif params[:id]
      # @game = Game.find(params[:id])        
   #  end
   @game = Game.find(params[:id])
  end
end
