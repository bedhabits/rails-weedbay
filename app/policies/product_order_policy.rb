class ProductOrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def add_quantity?
    return true
  end

  def reduce_quantity?
    return true
  end

  def destroy?
    return true
  end
end
