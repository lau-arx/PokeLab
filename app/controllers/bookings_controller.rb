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
    @pokemon = Pokemon.find(params[:pokemon_id])
    authorize @booking
    authorize @pokemon
    @booking.user = current_user
    @booking.status = "Pending"
    @booking.pokemon = @pokemon
    if @booking.save
      redirect_to dashboard_path(tab: 'content-2')
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @pokemon = @booking.pokemon
    authorize @booking
    authorize @pokemon

    @booking.status =  params[:status][0]

    @pokemon.available = params[:status][1]

    if @booking.save! && @pokemon.save!
      redirect_to dashboard_path(tab: 'content-2')
    else
      render :new
    end

  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path(tab: 'content-2')
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
