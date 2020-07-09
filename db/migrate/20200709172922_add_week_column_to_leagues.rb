class AddWeekColumnToLeagues < ActiveRecord::Migration[6.0]
  def change
    add_column :fantasy_leagues, :week, :integer
  end
end
