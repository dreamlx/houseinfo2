class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, Unit
      can :manage, Building
      can :manage, RoomModel
      can :manage, Room
      can :manage, User
      can :manege, Order
    else
      can [:create, :read], Room
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end
  end

end