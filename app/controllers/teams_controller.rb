class TeamsController < ApplicationController

    def new
        if params[:city_id] && city = City.find_by_id(params[:city_id])
            @team = city.teams.build
        else
            @team = Team.new
            @team.build_city
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
        
    end 

    def show 
    end 

    def edit 
    end 

    def update
    end 

    private 
    def team_params
        params.require(:team).permit(:name, :user_id, :city_id )
    end 
end
