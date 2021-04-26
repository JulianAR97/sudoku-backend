class ScoresController < ApplicationController

  # POST /scores
  def create
    user = User.find(params[:user_id])
    @score = user.scores.build(time: score_params[:time], difficulty: score_params[:difficulty])
    
    if @score.save
      render json: @score, status: :created, location: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:user_id, :time, :difficulty)
    end
end
