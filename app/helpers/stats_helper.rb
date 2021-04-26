module StatsHelper
  def get_stats(user_id) 
    stats = {}
    user = User.find_by(id: user_id)
    if user 
      stats['gamesFinished'] = user.scores.total
      stats['totalByDifficulty'] = {}
      %w[easy medium hard expert].each do |d|
        stats['totalByDifficulty'][d] = user.scores.total_by_difficulty(d)
      end
    end
    stats
  end
end