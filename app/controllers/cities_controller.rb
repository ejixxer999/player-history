class CitiesController < ApplicationController
    def new
        @city = City.new
    end 

    def create
        @city = City.new(city_params)
        # @city.name = params[:name]
        # @city.state = params[:state]
        if
            @city.save!
            redirect_to cities_path(@city)
        else
            render new
        end 
    end 

  

    def index
        @cities = City.all
    end

    def show
        @city = City.find_by_id(params[:id])
    end 

    def edit
    end 

    def update
    end 

    def destroy
    end 

    private 

    def city_params
        params.require(:city).permit(:name, :state)
    end 

end

#https://www.youtube.com/watch?v=TXkAK7jjato google omniauth
