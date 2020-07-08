class AddTeamIdToSportsTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :sports_teams, :team_id, :integer
  end
end
