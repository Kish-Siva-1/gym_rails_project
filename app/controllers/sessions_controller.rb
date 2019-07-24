class SessionsController < ApplicationController
 
    def create
        binding.pry
        session[:username] = params[:username]
        redirect_to '/'
    end

    def destroy
        session.delete :username
    end

end
