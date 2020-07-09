class AddWinsColumnToFantasyTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :fantasy_teams, :wins, :integer
  end
end
