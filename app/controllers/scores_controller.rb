class ScoresController < ApplicationController
  before_action :set_game
  before_action :set_score, only: [:show], if: -> { params[:game_id].present? }

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @scores = @user.scores
    elsif params[:game_id]
      @game = Game.find(params[:game_id])
      @scores = @game.scores
    else
      @scores = Score.all
    end
  end

  def show
  end

  def new
    @score = @game.scores.build
  end

  def create
    @score = @game.scores.build(score_params)
    @score.user = current_user
    if @score.save
      redirect_to game_score_path(@game), notice: "Score created successfully."
    else
      render :new
    end
  end

  private

  def set_game
    return unless params[:game_id]

    @game = Game.find(params[:game_id])
  end

  def set_score
    @score = @game.scores.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:points, :round_number)
  end
end
