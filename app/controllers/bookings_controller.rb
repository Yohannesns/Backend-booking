class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :find_site

  # GET /bookings 
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings 
  def create
    @booking = Booking.new(params[:booking].permit(:site_hotel_id, :start_time, :length))
    @booking.site_hotel = @site_hotel
     if @booking.save
      redirect_to  site_site_hotel_bookings_path(@site, @site_hotel, method: :get)
     else
      render 'new'
     end
    end
  end

  # PATCH/PUT /bookings/1 
  def update  
    @booking = Booking.find(params[:id])  
    # @booking.site_hotels = @site_hotels  
  
    if @booking.update(params[:booking].permit(:site_hotel_id, :start_time, :length))  
      flash[:notice] = 'Your booking was updated successfully'  
  
      if request.xhr?  
        render json: {status: :success}.to_json  
      else  
        redirect_to site_site_hotel_bookings_path(@site, @site_hotel)  
      end  
    else  
      render 'edit'  
    end  
  end

  # DELETE /bookings/1 
  def destroy  
    @booking = Booking.find(params[:id]).destroy  
    if @booking.destroy  
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"  
      redirect_to site_site_hotel_bookings_path(@site, @site_hotel)  
    else  
      render 'index'  
    end  
  end
 
  def save booking  
    if @booking.save  
        flash[:notice] = 'booking added'  
        redirect_to site_site_hotel_booking_path(@site, @site_hotel, @booking)  
      else  
        render 'new'  
      end  
  end

  private
    
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:name, :start_time, :end_time)
    end
    
    def find_site 
      if params[:site_id]  
         @site = Site.find_by_id(params[:site_id])  
    end
end

