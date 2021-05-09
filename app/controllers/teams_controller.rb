class TeamsController < ApplicationController

    def new
        if params[:city_id] && city = City.find_by_id(params[:city_id])
            @team = city.teams.build
        else
            @team = Team.new
        end
    end 
    
    def create
        @team = current_user.teams.build(team_params)
        if @team.save
            redirect_to user_path(@team.user)
        else
            @team.build_city unless @team.city
            render :new
        end
    end 

    def index
        if params[:city_id]
            @city = City.find_by(id: params[:city_id])
            if @city.nil?
                redirect_to cities_path
            else
                @teams = @city.teams
            end
        else
            @teams = Team.all
        end
    end 

    def show 
        @team = Team.find_by_id(params[:id])
        
    end 

    def edit 
    end 

    def update
    end 

    private 

    def set_teams
        @team = Team.find_by_id(params[:id])
    end
    def team_params
        params.require(:team).permit(:name, :user_id, :city_id, city_attributes: [:name, :state])
    end 
end
