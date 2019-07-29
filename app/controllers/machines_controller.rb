class MachinesController < ApplicationController

    def new
        if signed_in? 
           @routine = Routine.find_by(id: params.permit(:routine_id).values[0])
            @weight = @routine.weights.build
            @machine = @weight.build_machine
        else
            redirect_to '/login'
        end   
    end 

    def create
        if signed_in? 
            @machine = Machine.create(machine_params)
            if @machine.valid? 
                @routine = @machine.weights.last.routine
                redirect_to user_routine_path(current_user, @routine)    
            else
                @routine = Routine.find_by(id: params.permit(:routine_id).values[0]) 
                render 'new'
            end
        else
            redirect_to '/login'
        end 
    end

    def show
        if signed_in? 
           @machine = Machine.find(params[:id])
        else
            redirect_to '/login'
        end
    end

    def edit
        if signed_in? 
            @machine = Machine.find(params[:id])
            @routine = @machine.weights.last.routine
        else
            redirect_to '/login'
        end
    end

    def update
        if signed_in? 
            @machine = Machine.find(params[:id])
            @machine.update(machine_params)
            if @machine.valid? 
                @routine = @machine.weights.last.routine
                redirect_to user_routine_path(current_user, @routine)    
            else
                @routine = Routine.find_by(id: params.permit(:routine_id).values[0]) 
                render 'new'
            end
        else
            redirect_to '/login'
        end
    end

    def destroy
        if signed_in?
            @routine = Machine.find(params[:id]).weights.last.routine
            Machine.find(params[:id]).destroy
            redirect_to user_routine_path(current_user, @routine)
        else 
            redirect_to '/login'
        end  
    end

    private

    def machine_params
        params.require("machine").permit(:name, :repetitions, :sets, weights_attributes: [:weight, :routine_id, :machine_id])
    end

end
