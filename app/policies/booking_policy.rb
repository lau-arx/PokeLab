class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end



  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    record.pokemon.user == user
  end

  def update?
    edit?
  end

  def destroy?
    true
  end

end
