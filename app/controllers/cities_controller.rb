class CitiesController < ApplicationController
     before_action :security


    def new
        @city = City.new
    end 

    def create
        @city = current_user.cities.new(city_params)
        @city = current_user.cities.build(city_params)
        
        if
            @city.save
           redirect_to cities_path
        else
            render new
        end 
       
    end 

  

    def index
        @cities = City.all.order_by_name
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
