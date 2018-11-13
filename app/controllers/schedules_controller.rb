class SchedulesController < ApplicationController
  require 'json'
  include SchedulesHelper
  
  def new
    shifts = current_user.patterns.collect {|p| p.shifts}.flatten
    assignments = current_user.staffs.collect {|s| s.assignments}.flatten    
    @optimizer_hash = {shifts: [], assignments: [], patterns: [], staffs: []}
    shifts.each {|shift| @optimizer_hash[:shifts].push(JSON.parse(shift.to_json))}
    assignments.each {|assignment| @optimizer_hash[:assignments].push(JSON.parse(assignment.to_json))}
    current_user.patterns.each {|p| @optimizer_hash[:patterns].push(JSON.parse(p.to_json))}
    current_user.staffs.each {|s| @optimizer_hash[:staffs].push(JSON.parse(s.to_json))}
  end

  def index
    @current_period = Schedule.find_by(period: Time.new.strftime("%Y-%m"))    
    redirect_to schedule_path(@current_period) if user_signed_in?    
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
    @assignments = Assignment.all
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