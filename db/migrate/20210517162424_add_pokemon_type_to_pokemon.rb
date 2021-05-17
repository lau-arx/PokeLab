class AddPokemonTypeToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :category, :string
  end
end
