class SportsTeam < ActiveRecord::Base
  belongs_to :fantasy_team

  def self.shuffle_rank
    i = 1
    all.shuffle.each do |sports_team|
      sports_team.rank = i
      i += 1
    end
  end
end
