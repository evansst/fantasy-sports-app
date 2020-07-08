class RenameLeagueTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :leages, :leagues
  end
end
