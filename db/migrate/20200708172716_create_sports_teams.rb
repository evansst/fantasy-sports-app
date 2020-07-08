class CreateSportsTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :sports_teams do |t|
      t.string :name
      t.integer :fantasy_team_id
    end
  end
end
