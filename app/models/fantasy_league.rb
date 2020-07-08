class FantasyLeague < ActiveRecord::Base
  has_many :fantasy_teams
  has_many :users, through: :fantasy_teams
end
