class UsersController < ApplicationController
    
    def show
        if signed_in?
            @user = current_user 
        else 
            redirect_to '/login'
        end 
    end

end
