class SchedulesController < ApplicationController
  include SchedulesHelper
   
  def index
    @current_period = Schedule.find_by(period: Time.new.strftime("%Y-%m"))    
    redirect_to schedule_path(@current_period) if user_signed_in?    
  end

  def new
    @schedule = Schedule.new
  end

  def show
    @schedule = Schedule.find(params[:id])
    @staffs = current_user.staffs.all
    @staff = current_user.staffs.new
    @patterns = current_user.patterns.all
    @pattern = current_user.patterns.new
    @shifts = Shift.all
    @date_array = get_schedule_header(@schedule)        
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