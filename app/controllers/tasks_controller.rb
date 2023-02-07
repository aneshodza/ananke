class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @task = Task.new
    @task.project_id = params[:project]
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to project_path(@task.project)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.finished = true
    @task.save
    redirect_to project_path(@task.project)
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :finished, :project_id, :description,
                                 :assigned_user_id, :creator_id)
  end
end

