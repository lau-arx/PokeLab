class PagesController < ApplicationController
  def home
  end

  def dashboard
    @pokemons = Pokemon.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end

  def random_shot
    @pokemon = Pokemon.where(user: current_user).sample
    redirect_to new_pokemon_booking_path(@pokemon)
    # @pokemons = policy_scope(Pokemon).order(created_at: :desc)
    # @pokemons = Pokemon.sample
  end

  def know_more

  end

  def heavy_stuffs

  end

  def true_freedom

  end

  def hazardous_places

  end

  def cozy_day

  end
end
