module StatsHelper
  def get_stats(user_id) 
    stats = {}
    user = User.find_by(id: user_id)
    if user 
      stats['gamesFinished'] = user.scores.total
      stats['totalByDifficulty'] = {}
      stats['averageByDifficulty'] = {}
      stats['topTenByDifficulty'] = {}
      %w[easy medium hard expert].each do |d|
        stats['totalByDifficulty'][d] = user.scores.total_by_difficulty(d)
        stats['averageByDifficulty'][d] = user.scores.average_by_difficulty(d)
        stats['topTenByDifficulty'][d] = user.scores.top_ten_by_difficulty(d).map(&:time)
      end
    end
    stats
  end
end