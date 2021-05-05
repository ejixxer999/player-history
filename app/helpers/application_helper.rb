module ApplicationHelper
    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end 

    def security
        if !logged_in?
            redirect_to root_path
        end
    end 
end
