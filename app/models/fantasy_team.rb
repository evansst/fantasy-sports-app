class FantasyTeam < ActiveRecord::Base
  belongs_to :user
  belongs_to :fantasy_league
  has_many :sports_teams

  def draft_team sports_team
    self.sports_teams << sports_team
  end




end
