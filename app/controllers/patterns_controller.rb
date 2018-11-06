class PatternsController < ApplicationController
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @pattern = @schedule.patterns.create(pattern_params)
    
    if @pattern.persisted?
      redirect_to schedule_path(@schedule)
      flash[:notice] = "New pattern was successfully created"
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
