class RoutinesController < ApplicationController
    before_action :require_login
    before_action :authenticate_user!

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
            if @routine.nil?
                redirect_to user_path(current_user)
            else 
                authorize @routine
            end
    end

    def edit
           @routine = Routine.find_by(params.permit(:id))  
    end

    def update
            @routine = Routine.find_by(params.permit(:id))
            if @routine.nil?
                redirect_to user_path(current_user)
            else 
                authorize @routine
            end
            @routine.update(params.require(:routine).permit(:name))
            if @routine.valid?
                redirect_to user_routine_path(current_user, @routine)    
            else
                render 'edit'
            end
    end

    def destroy
            @routine = Routine.find_by(params.permit(:id))
            authorize @routine
            if !@routine.nil? 
                @routine.destroy                
            end
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
