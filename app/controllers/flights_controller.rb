class FlightsController < ApplicationController

 def index
	@flights= Flight.all
	@flight = Flight.new
end

def new
	redirect_to flights_path
end

def create

	@flights= Flight.all
	@flight = Flight.new(flight_params)
 
	if @flight.save
		redirect_to flights_path
	else
		render 'index'
	end
end

def update

	  @flights= Flight.all
	  @flight = Flight.find(params[:id])
 
	  if @flight.update(flight_params)
		redirect_to flights_path
	  else
		redirect_to flights_path
	  end


end

def destroy

  @flight = Flight.find(params[:id])
  @flight.destroy
 
  redirect_to flights_path
end


private
  def flight_params
    params.require(:flight).permit(:from, :to, :start_time, :flying_time, :carrier_name, :flight_model)
  end


end
