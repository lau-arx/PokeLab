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
    @pokemon.user = current_user
    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  # def edit
  #   @pokemon = Pokemon.find(params[:id_edit])
  # end

  # def update

  # end

  private

  def pokemon_params
    params.require(:pokemon).permit(:user, :name, :category, :description, :height, :weight, :special_attack, :price_per_day, :health_point)
  end
end
