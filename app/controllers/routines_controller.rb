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
    end

    def update
    end

    def destroy
    end

    private 

    def routine_params
        params.require(:routine).permit(:name)
    end

end
