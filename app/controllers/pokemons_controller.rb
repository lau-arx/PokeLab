class PokemonsController < ApplicationController
  before_action :find_pokemon, only: [:show, :edit, :update, :destroy]
  def index
    @pokemons = policy_scope(Pokemon).order(created_at: :desc)

    @pokemons = @pokemons.where("name ILIKE ?", "%#{params[:pokemon_name]}%") if params[:pokemon_name]
    @pokemons = @pokemons.where("address ILIKE ?", "%#{params[:location]}%") if params[:location]
    @pokemons = @pokemons.where("category ILIKE ?", "%#{params[:category]}%") if params[:category]


    # @pokemons = @pokemons.near(params[:search], 25)
    @markers = @pokemons.geocoded.map do |pokemon|
      {
        lat: pokemon.latitude,
        lng: pokemon.longitude
      }
    end
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    authorize @pokemon
    @pokemon.user = current_user
    if @pokemon.save
      redirect_to pokemons_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pokemon.update(pokemon_params)
    redirect_to pokemon_path
  end

  def destroy
    @pokemon.destroy
    redirect_to dashboard_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:photo, :user, :name, :category, :description, :height, :weight, :special_attack, :price_per_day, :health_point, :address)
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end
end
