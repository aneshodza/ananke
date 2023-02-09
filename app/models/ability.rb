# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can [:read], Project
    can [:read, :update], Project, project_owner_id: user.id

    can [:read, :update, :create], Task
    can [:destroy], Task, project: { project_owner_id: user.id }

    can [:read, :my_tasks], User

    return unless user.admin?

    can [:read, :update, :create, :destroy], Project
    can [:read, :update, :create, :destroy], Task
    can [:update, :create, :destroy], User
  end
end
