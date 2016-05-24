class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def show
    @posts = @game.posts
  end


  private

  def set_game
    @game = Game.find_by_name(params[:id])
  end

end
