# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @users = User.all
  end

  def my_tasks
    @assigned_tasks = Task.where(assigned_user: current_user)
    @created_tasks = Task.where(creator: current_user)
  end
end
