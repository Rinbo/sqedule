class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
    @staffs = Staff.all
    @staff = Staff.new
  end

  def create
    @schedule = current_user.schedules.create(schedule_params)
    if @schedule.persisted?
      redirect_to @schedule
      flash[:notice] = "New schedule successfully created"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:period)
  end

  
end