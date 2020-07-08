class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :fantasy_leagues do |t|
      t.string :name
    end
  end
end
