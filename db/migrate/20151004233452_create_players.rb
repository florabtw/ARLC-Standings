class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :username
      t.string :psn_id
      t.string :steam_id

      t.timestamps null: false
    end
  end
end
