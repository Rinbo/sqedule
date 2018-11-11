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
    current_id = params[:id].to_i
    @schedule = Schedule.find(current_id)
    @next_month = get_another_month(current_id + 1)
    @prev_month = get_another_month(current_id - 1)
    @staffs = current_user.staffs.all
    @patterns = current_user.patterns.all
    @shift = Shift.new
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

  def get_another_month(id)
    begin
      Schedule.find(id)
    rescue
    end
  end

  def schedule_params
    params.require(:schedule).permit(:period)
  end

  
end