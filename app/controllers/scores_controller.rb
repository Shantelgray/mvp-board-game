class ScoresController < ApplicationController
  before_action :set_game
  before_action :set_score, only: [ :show]

  def index
    @scores = @game.scores
  end

  def new
     @score = @game.scores.build
  end

  def show
  end

  def create
     @score = @game.scores.build(score_params)
     @score.user = current_user
    if @score.save
      redirect_to game_score_path(@game, @score), notice: "Score created successfully."
    else
      render :new
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_score
    @score = @game.scores.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:points, :round_number)
  end
end
