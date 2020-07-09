class AddRankToSportsTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :sports_teams, :rank, :integer
  end
end
