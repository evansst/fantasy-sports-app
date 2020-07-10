class User < ActiveRecord::Base
  has_many :fantasy_teams
  has_many :sports_teams, through: :fantasy_teams
  has_many :fantasy_leagues, through: :fantasy_teams

  def create_fantasy_team fantasy_team_name
    FantasyTeam.create(name: fantasy_team_name, wins: 0, user_id: id)
  end

  def join_league league, fantasy_team_name
    new_fantasy_team = create_fantasy_team(fantasy_team_name)
    new_fantasy_team.update(fantasy_league_id: league.id)
    new_fantasy_team
  end

  def get_leagues
    get_teams.map do |team|
      FantasyLeague.where(id: team.fantasy_league_id)
    end.flatten
  end

  def get_teams
    FantasyTeam.where(user_id: id)
  end
end
