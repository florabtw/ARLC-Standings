class AddAltNameToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :alt_name, :string
  end
end
