class ChangeDefaultAvailableToPokemons < ActiveRecord::Migration[6.0]
  def change
    change_column :pokemons, :available, :boolean, :default => true
  end
end
