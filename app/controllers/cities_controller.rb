class CitiesController < ApplicationController
    def new
    end 

    def create
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

end
