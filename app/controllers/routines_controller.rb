class RoutinesController < ApplicationController
    before_action :require_login

    def new
            @routine = Routine.new
    end 

    def create
            @routine = current_user.routines.create(routine_params)
            if @routine.valid?
                redirect_to user_path(current_user)    
            else
                render 'new'
            end
    end

    def index
           @routines = current_user.routines
    end

    def show
            @routine = Routine.find_by(params.permit(:id))
    end

    def edit
           @routine = Routine.find_by(params.permit(:id))  
    end

    def update
            @routine = Routine.find_by(params.permit(:id))
            @routine.update(params.require(:routine).permit(:name))
            if @routine.valid?
                redirect_to user_routine_path(current_user, @routine)    
            else
                render 'edit'
            end
    end

    def destroy
            @routine = Routine.find_by(params.permit(:id)).destroy
            redirect_to user_path(current_user)
    end

    private 

    def routine_params
        params.require(:routine).permit(:name)
    end
  
    def require_login
        if current_user.nil? 
        redirect_to '/login'
        end
    end

end
