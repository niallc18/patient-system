class PatientPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        if user.doctor?
          scope.all
        elsif user.receptionist?
          scope.all
        else
          scope.none
        end
      end
    end
  
    def index?
      user.doctor? || user.receptionist?
    end
  
    def show?
      user.doctor? || user.receptionist?
    end
  
    def create?
      user.receptionist?
    end
  
    def update?
      user.receptionist?
    end
  
    def destroy?
      user.receptionist?
    end
  end
  