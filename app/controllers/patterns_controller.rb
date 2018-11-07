class PatternsController < ApplicationController
  include SchedulesHelper

  def create
    @schedule = Schedule.find(params[:schedule_id])
    @pattern = @schedule.patterns.create(pattern_params)
    get_schedule_header(@schedule).each do |date|
      @pattern.shifts.create(date: date, cleaning: @pattern.cleaning)
    end

    if @pattern.persisted? && @pattern.shifts.any?
      redirect_to schedule_path(@schedule)
      flash[:notice] = "New shift pattern and shift objects were successfully created"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  private

  def pattern_params
    params.require(:pattern).permit(:schedule_id, :shift_start, :shift_length, :break_length, :cleaning)
  end
end
