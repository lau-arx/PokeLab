class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.save
    redirect_to pokemons_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end
