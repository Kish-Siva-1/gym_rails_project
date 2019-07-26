class MachinesController < ApplicationController

    def new
        @routine = Routine.find_by(params.permit(:routine_id).values)
    end 

    def create
        @routine = Routine.find_by(params.permit(:routine_id).values)
        @machine = @routine.weights.create(weight_params).create_machine!(machine_params)
        @weight = @routine.weights.last.machine
        redirect_to user_routine_path(current_user, @routine)
    end

    def index
    end

    def show
        @machine = Machine.find(params[:id])
    end

    def edit
        binding.pry
        @machine = Machine.find(params[:id])
    end

    def update
    end

    def destroy
    end

    private

    def machine_params
        params.require("machine").permit(:name, :repetitions, :sets)
    end

    def weight_params
        params.require("machine").require(:weights).permit(:weight)
    end

end
