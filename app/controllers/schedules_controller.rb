class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @planning_period = PlanningPeriod.find(params[:id])
  end
  
end