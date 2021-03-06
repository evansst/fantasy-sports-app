class SportsTeam < ActiveRecord::Base
  belongs_to :fantasy_teams
  has_many :leagues

  def self.shuffle_rank
    all.shuffle.reduce(1) do |i, sports_team|
      sports_team.update(rank: i)
      i + 1
    end
    all
  end

  def self.list_by_rank
    list = all.sort_by(&:rank)
    list.map do |sports_team|
      "#{sports_team.rank} - #{sports_team.name}"
    end
  end

  def self.list_all
    all.map(&:name)
  end
end
