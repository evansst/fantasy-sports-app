class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :fantasy_teams do |t|
      t.string :name
      t.integer :user_id
      t.integer :fantasy_league_id
      t.integer :wins
      t.integer :schedule_number
      t.integer :sports_team_id
    end
  end
end
