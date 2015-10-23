class RemoveAltNameFromPlayer < ActiveRecord::Migration
  def change
    remove_column :players, :alt_name, :string
  end
end
