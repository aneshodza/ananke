class TimeUnitsController < ApplicationController
  authorize_resource

  def index
    @time_units = TimeUnit.my_ended_time(current_user)
    @my_unended_time = TimeUnit.where(user: current_user).where(end_time: nil).first
    if @my_unended_time.nil?
      @my_unended_time = TimeUnit.new(user: current_user, 
                                      start_time: Time.now.beginning_of_minute)
      @my_unended_time.save!
    end
  end

  def create
    @time_unit = TimeUnit.find(time_unit_params[:id])
    @time_unit.end_time = Time.now if @time_unit.end_time.nil?
    @time_unit.task_id = time_unit_params[:task_id]
    @time_unit.description = time_unit_params[:description]
    if @time_unit.save!
      flash[:notice] = 'Time unit was successfully created.'
    else
      # :nocov:
      flash[:notice] = 'Time unit was not created.'
      # :nocov:
    end
    redirect_to time_units_path
  end

  def destroy
    @time_unit = TimeUnit.find(params[:id])
    @time_unit.destroy
    redirect_to time_units_path
  end

  private

  def time_unit_params
    params.require(:time_unit).permit(:start_time, :end_time, :description, :user_id, :task_id, 
                                      :id)
  end
end
