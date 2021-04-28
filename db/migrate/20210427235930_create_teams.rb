class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :player_id
      t.integer :city_id

      t.timestamps
    end
  end
end
