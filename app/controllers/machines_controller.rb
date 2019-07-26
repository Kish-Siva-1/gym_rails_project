class MachinesController < ApplicationController

    def new
        @routine = Routine.find_by(params.permit(:routine_id).values)
        @weight = @routine.weights.build
        @machine = @weight.build_machine
    end 

    def create
        @machine = Machine.create(machine_params)
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
        params.require("machine").permit(:name, :repetitions, :sets, weights_attributes: [:weight, :routine_id])
    end

end
