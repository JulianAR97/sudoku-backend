require_relative '../helpers/stats_helper.rb'

class StatsController < ApplicationController
  include StatsHelper
  
  def index
    user = User.find(stats_params[:user_id])
    @stats = {}
    if user
      @stats = get_stats(user)
    end

    render json: @stats
  end


  private

    def stats_params
      params.permit(:user_id)
    end

end
