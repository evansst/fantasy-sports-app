class FantasyLeague < ActiveRecord::Base
  has_many :fantasy_teams
  has_many :sports_teams, through: :fantasy_teams
  has_many :users, through: :fantasy_teams

  def add_fantasy_team user, fantasy_team_name
    new_fantasy_team = user.create_fantasy_team(fantasy_team_name)
    fantasy_teams << new_fantasy_team
    new_fantasy_team
  end

  def self.list_all_leagues
    all.map(&:name)
  end

  def play_a_game fantasy_team1, fantasy_team2
    sports_team1 = SportsTeam.find_by(id: fantasy_team1.sports_team.id)
    sports_team2 = SportsTeam.find_by(id: fantasy_team2.sports_team.id)

    if sports_team1.rank < sports_team2.rank
      fantasy_team1.wins += 1
      fantasy_team1.save
    else
      fantasy_team2.wins += 1
      fantasy_team2.save
    end
  end

  def standings
    fantasy_teams.sort { |a, b| b.wins <=> a.wins }
  end
end
