class Ability
  include CanCan::Ability

  def initialize(user )
    user ||= AdminUser.new
    if user.role == "manager" 
      can :manage, ActiveAdmin::Page, :name => "Dashboard"
      can :manage, Unit
      can :manage, Building
      can :manage, RoomModel
      can :manage, Room      
      can :manage, Order
      can :manage, AdminUser
    end

    if user.role == "staff"
      can :read, ActiveAdmin::Page, :name => "Dashboard"
      can :read, Unit
      can :read, Building
      can :read, RoomModel
      can :read, Room      
      can [:read, :create], Order
      # can :read, AdminUser
      can [:read, :update], AdminUser, :id => user.id
    end
  end

end
