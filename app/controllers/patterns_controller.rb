class PatternsController < ApplicationController
  include SchedulesHelper

  def create
    @pattern = current_user.patterns.create(pattern_params)

    if @pattern.persisted?
      redirect_to schedule_path(@schedule)
      flash[:notice] = "New shift pattern was successfully created"
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
