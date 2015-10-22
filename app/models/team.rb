class Team < ActiveRecord::Base
  belongs_to :season
  has_many :memberships
  has_many :players, through: :memberships

  has_many :home_matches, class_name: 'Match', foreign_key: :home_team_id
  has_many :away_matches, class_name: 'Match', foreign_key: :away_team_id

  def matches
    self.home_matches + self.away_matches
  end

  def wins
    matches.select { |m| m if m.won? self }.size
  end

  def losses
    matches.size - wins
  end

  def goals_for
    home_goals_for = home_games.reduce(0) { |sum, g| sum + g.home_score }
    away_goals_for = away_games.reduce(0) { |sum, g| sum + g.away_score }

    return home_goals_for + away_goals_for
  end

  def goals_against
    home_goals_against = home_games.reduce(0) { |sum, g| sum + g.away_score }
    away_goals_against = away_games.reduce(0) { |sum, g| sum + g.home_score }

    return home_goals_against + away_goals_against
  end

  def goal_difference
    goals_for - goals_against
  end

  def goals_per_game
    games = home_games + away_games
    goals_for / games.size.to_f
  end

  def players_string
    self.players.map(&:username).join(',')
  end

  def to_s
    self.name
  end

  private
    def home_games
      self.home_matches.reduce([]) { |list, m| list + m.games }
    end

    def away_games
      self.away_matches.reduce([]) { |list, m| list + m.games }
    end
end
