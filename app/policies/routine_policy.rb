class RoutinePolicy < ApplicationPolicy

    def update?
        record.user == user
    end

    def show?
        record.user == user 
    end

    def create?
        record.user == user 
    end

    def new?
        create?
    end

    def update?
        record.user == user
    end

    def edit?
        update?
    end

    def destroy?
        record.user == user
    end

end