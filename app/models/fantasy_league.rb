class FantasyLeague < ActiveRecord::Base
  has_many :fantasy_teams
  has_many :users, through: :fantasy_teams

  def add_fantasy_team user, fantasy_team_name
    new_team = user.create_fantasy_team(fantasy_team_name)
    fantasy_teams << new_team
  end

  def self.list_all_leagues
    all.map(&:name)
  end

  def play_a_game fantasy_team1, fantasy_team2
    if fantasy_team1.sports_team.rank < fantasy_team2.sports_team.rank
      fantasy_team1.wins += 1
    else
      fantasy_team2.wins += 1
    end
  end
end
