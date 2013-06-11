class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Page
    can :read, Group
    can :create, Order
    if user.admin?
      can :manage, :all
    elsif user.teacher?
      can :read, :all
      can :create, [Message, Desk]
      can :read, [Desk, Student]
      cannot :read, [User, Group, Order]
    elsif user.warden?
      can :read, :all
      can :create, [Message, Desk]
      can [:create, :update, :delete], Student
      can :create, Group
      can :read, [Student]
      cannot :read, [Group, Order]
    end
  end
end
