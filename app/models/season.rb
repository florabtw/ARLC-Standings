class Season < ActiveRecord::Base
  belongs_to :division
  has_many :teams

  def matches
    Match.all.select { |m| m if m.home_team.season == self }
  end

  def ordered_teams
    self.teams.sort_by { |t| [-t.wins, -t.goal_difference, -t.goals_for] }
  end

  def standings
    standings = []
    ordered_teams.each do |team|
      standing = {}
      standing[:id] = team.id
      standing[:name] = team.name
      standing[:wins] = team.wins
      standing[:losses] = team.losses
      standing[:goals_for] = team.goals_for
      standing[:goals_against] = team.goals_against
      standing[:goal_difference] = team.goal_difference
      standing[:goals_per_game] = team.goals_per_game
      standing[:players] = []

      team.players.each do |player|
        result = {}
        result[:name] = player.username
        result[:goals] = player.team_goals(team)
        result[:assists] = player.team_assists(team)
        result[:saves] = player.team_saves(team)
        result[:shots] = player.team_shots(team)
        standing[:players] << result
      end

      standings << standing
    end

    standings
  end

  def meta_info
    [
      self.division.region.name,
      self.division.league.name,
      self.division.name,
      self.name
    ].join(' - ')
  end

  def to_s
    self.division.to_s + ', ' + self.name
  end
end
