class ScoresController < ApplicationController

  # POST /scores
  def create
    user = User.find_or_create_by(cookie: params[:user_id])
    @score = Score.new(time: score_params[:time], user_id: user.id)

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
