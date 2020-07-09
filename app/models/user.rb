class User < ActiveRecord::Base
  has_many :fantasy_teams
  has_many :sports_teams, through: :fantasy_teams
  has_many :fantasy_leagues, through: :fantasy_teams

  def create_fantasy_team fantasy_team_name
    new_fantasy_team = FantasyTeam.create(name: fantasy_team_name, wins: 0)
    fantasy_teams << new_fantasy_team
  end

  def join_league league, fantasy_team_name
    new_team = create_fantasy_team(fantasy_team_name)
    league.fantasy_teams << new_team
  end
end
