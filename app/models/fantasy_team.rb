class FantasyTeam < ActiveRecord::Base
  belongs_to :user
  belongs_to :fantasy_league

  def draft_team sports_team
    update(sports_team_id: sports_team.id) unless taken(sports_team)
  end
  
  def sports_team
    SportsTeam.find_by(id: sports_team_id)
  end
  
  def taken sports_team
    sports_team_taken = FantasyTeam.find_by(sports_team_id: sports_team.id)
    same_league = sports_team_taken.fantasy_league_id == fantasy_league_id if sports_team_taken
    return true if sports_team_taken && same_league

    false
  end

  def show_schedule
  end
end
