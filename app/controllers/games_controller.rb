class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(params[:name])
  end

  private

  def game_params
    params.require(:game).permit(:name, :genre)
  end
end
