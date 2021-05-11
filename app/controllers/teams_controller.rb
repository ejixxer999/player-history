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
        if params[:city_id]
            city = City.find_by_id(params[:city_id])
            if city.nil?
                redirect_to cities_path
            else
                @team = city.team.find_by_id(params[:id])
                redirect_to city_team_path(city)
            end
        else
            set_teams
        end
    end
        # if current_user
        #     @team = current_user.teams.find_by_id(params[:id])
        # end    
    

    def update
        @team = Team.find_by_id(params[:id])
        if @team && @team.update(team_params)
            redirect_to city_team_path(@team.city)
        else
            render :edit
        end
    end 

    def destroy
        set_teams
        @team.destroy
        redirect_to user_path
        
    end 

    private 

    def set_teams
        @team = Team.find_by_id(params[:id])
        if !@team
            redirect_to user_path
        end
    end
    def team_params
        params.require(:team).permit(:name, :user_id, :city_id, city_attributes: [:name, :state])
    end 
end
