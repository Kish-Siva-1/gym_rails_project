class MachinePolicy < ApplicationPolicy

    def create?
        record.routines.last.user == user 
    end

    def new?
        record.user == user
    end

    def update?
        record.routines.last.user == user
    end

    def edit?
        update?
    end

    def destroy?
        record.routines.last.user == user
    end

end