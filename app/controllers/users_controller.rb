class UsersController < ApplicationController
    def new 
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.in
            redirect_to user_path(@user)
        else
            render new

    end 

    def index
    end 

    def show
        @user = current_user
    end 

    def edit
    end

    def update
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

    
end
