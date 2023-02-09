# frozen_string_literal: true

class UsersController < ApplicationController
  authorize_resource

  def index
    @users = User.all
  end

  def my_tasks
    @assigned_tasks = Task.unfinished.where(assigned_user: current_user)
    @created_tasks = Task.unfinished.where(creator: current_user)
  end
end
