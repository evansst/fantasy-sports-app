class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leages do |t|
      t.string :name
    end
  end
end
