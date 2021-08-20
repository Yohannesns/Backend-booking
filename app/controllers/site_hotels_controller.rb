class SiteHotelsController < ApplicationController
  before_action :set_site_hotel, only: %i[ show edit update destroy ]
  before_action :find_site

  # GET /site_hotels 
  def index
    if @site.nil?
      @site_hotels = SiteHotel.all
    else
      @site_hotels = SiteHotel.where("site_id = ?" , @site)
    end  
  end

  # GET /site_hotels/1 
  def show
  end

  # GET /site_hotels/new
  def new
    @site_hotel = SiteHotel.new
  end

  # GET /site_hotels/1/edit
  def edit
  end

  # POST /site_hotels 
  
  def create
    @site_hotel = SiteHotel.create(site_hotel_params)
      if @site_hotel.save
        redirect_to site_hotels_path           
      else  
        render 'new'  
        flash[:error] = "Unable to create site hotel. Please try again"  
    end
  end

  # PATCH/PUT /site_hotels/1 
  def update
    respond_to do |format|
      if @site_hotel.update(site_hotel_params)
        format.html { redirect_to @site_hotel, notice: "Site hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @site_hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site_hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /site_hotels/1
  def destroy
    @site_hotel.destroy
    respond_to do |format|
      format.html { redirect_to site_hotels_url, notice: "Site hotel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_site_hotel
      @site_hotel = SiteHotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_hotel_params
      params.require(:site_hotel).permit(:site_id, :hotel_id)
    end

    def site_hotel_params  
      params.require(:site_hotel).permit(:name, :delete)  
   end  
   
    def find_site
      if params[:site_id]  
         @site = Site.find_by_id(params[:site_id])  
      end  
   end 
end
