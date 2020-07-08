class SportsTeam < ActiveRecord::Base
  belongs_to :fantasy_team
  # belongs_to :user, through: :fantasy_team
end
