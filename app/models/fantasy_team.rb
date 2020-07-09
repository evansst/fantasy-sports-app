class FantasyTeam < ActiveRecord::Base
  belongs_to :user
  belongs_to :fantasy_league
  has_one :sports_team

  def draft_team sports_team
    self.sports_team = sports_team unless sports_team.fantasy_team_id
  end
end
