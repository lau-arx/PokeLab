class AddAvailableToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :available, :boolean
  end
end
