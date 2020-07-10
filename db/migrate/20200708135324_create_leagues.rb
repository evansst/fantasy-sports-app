class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :fantasy_leagues do |t|
      t.string :name
      t.integer :week
      t.boolean :drafted
    end
  end
end
