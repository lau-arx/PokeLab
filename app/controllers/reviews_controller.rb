class ReviewsController < ApplicationController

  def show

    @pokemon = Pokemon.find(params[:id])
    @reviews = @pokemon.reviews
    authorize @reviews
    authorize @pokemon
  end

  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
    authorize @booking
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @pokemon = @booking.pokemon
    authorize @booking
    authorize @review
    authorize @pokemon
    @review.booking = @booking

    if @review.save
      redirect_to dashboard_path(tab: 'content-2')
    else
      render 'pages/dashboard'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :booking_id, :id)
  end
end
