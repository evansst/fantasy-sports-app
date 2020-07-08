class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.integer :leage_id
    end
  end
end
