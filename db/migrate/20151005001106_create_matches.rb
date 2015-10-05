class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :home_team, index: true, foreign_key: true
      t.references :away_team, index: true, foreign_key: true
      t.references :match_status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
