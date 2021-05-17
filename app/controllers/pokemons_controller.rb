class PokemonsController < ApplicationController

  def new
    @pokemon = Pokemon.new
  end
end
