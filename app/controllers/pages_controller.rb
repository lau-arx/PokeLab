class PagesController < ApplicationController
  def home
  end

  def dashboard
    @pokemons = Pokemon.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
