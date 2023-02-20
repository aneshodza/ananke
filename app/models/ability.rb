# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can [:read], Project
    can [:update], Project, project_owner_id: user.id

    can [:read, :update, :create], Task
    can [:destroy], Task, project_owner: user
    
    can [:read, :create], Comment
    can [:update, :destroy], Comment, user_id: user.id

    can [:read, :my_tasks], User
    can [:update], User, id: user.id

    can [:read], TimeUnit
    can [:update, :destroy, :create], TimeUnit, user_id: user.id

    return unless user.admin?

    can [:read, :update, :create, :destroy], Project
    can [:read, :update, :create, :destroy], Task
    can [:update, :create, :destroy], User
  end
end
