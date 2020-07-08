class FantasyLeague < ActiveRecord::Base
  has_many :fantasy_teams
  has_many :users, through: :fantasy_teams

  def add_fantasy_team user, fantasy_team_name
    new_team = user.create_fantasy_team(fantasy_team_name)
    fantasy_teams << new_team
  end

end
