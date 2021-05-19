class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def new
    @booking = Booking.new
    @pokemon = Pokemon.find(params[:pokemon_id])
    authorize @pokemon
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.valid?
    @pokemon = Pokemon.find(params[:pokemon_id])
    authorize @booking
    authorize @pokemon
    @booking.user = current_user
    @booking.pokemon= @pokemon
    if @booking.save!
      redirect_to dashboard_path
    else
      raise
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :authenticity_token)
  end

  # def find_pokemon
  #   @pokemon = Pokemon.find(params[:id])
  #   authorize @pokemon
  # end
end
