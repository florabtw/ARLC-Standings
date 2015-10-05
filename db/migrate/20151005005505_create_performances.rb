class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.references :game, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true
      t.integer :goals
      t.integer :assists
      t.integer :saves
      t.integer :shots

      t.timestamps null: false
    end
  end
end
