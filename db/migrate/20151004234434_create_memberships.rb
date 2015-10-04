class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :team, index: true, foreign_key: true
      t.references :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
