class AddColumnsToFantasyTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :fantasy_teams, :computer, :boolean
    add_column :fantasy_teams, :schedule_number, :integer
  end
end
