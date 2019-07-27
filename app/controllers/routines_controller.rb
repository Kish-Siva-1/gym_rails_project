class RoutinesController < ApplicationController

    def new
        @routine = Routine.new
    end 

    def create
        @routine = current_user.routines.create(routine_params)
        redirect_to user_path(current_user)
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
        redirect_to user_routine_path(current_user, @routine)
    end

    def destroy
        @routine = Routine.find_by(params.permit(:id)).destroy
        redirect_to user_path(current_user)
    end

    private 

    def routine_params
        params.require(:routine).permit(:name)
    end

end
