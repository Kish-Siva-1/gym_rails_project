class RoutinesController < ApplicationController

    def new
        if signed_in? 
            @routine = Routine.new
        else
            redirect_to '/login'
        end 
    end 

    def create
        if signed_in? 
            @routine = current_user.routines.create(routine_params)
            if @routine.valid?
                redirect_to user_path(current_user)    
            else
                render 'new'
            end
        else
            redirect_to '/login'
        end 
    end

    def index
        if signed_in? 
           @routines = current_user.routines
        else
            redirect_to '/login'
        end
            
    end

    def show
        if signed_in?
            @routine = Routine.find_by(params.permit(:id))
        else 
            redirect_to '/login'
        end
    end

    def edit
        if signed_in? 
           @routine = Routine.find_by(params.permit(:id))  
        else
            redirect_to '/login'
        end
    end

    def update
        if signed_in? 
            @routine = Routine.find_by(params.permit(:id))
            @routine.update(params.require(:routine).permit(:name))
            if @routine.valid?
                redirect_to user_routine_path(current_user, @routine)    
            else
                render 'edit'
            end
        else
            redirect_to '/login'
        end
    end

    def destroy
        if signed_in?
            @routine = Routine.find_by(params.permit(:id)).destroy
            redirect_to user_path(current_user)
        else 
            redirect_to '/login'
        end
    end

    private 

    def routine_params
        params.require(:routine).permit(:name)
    end

end
