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
      user.doctor? || user.receptionist?
    end
  
    def update?
      user.doctor? || user.receptionist?
    end
  
    def destroy?
      user.doctor?
    end

    def patient_stats?
      user.doctor?
    end
  end
  