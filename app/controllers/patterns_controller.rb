class PatternsController < ApplicationController
  include SchedulesHelper

  def create
    @pattern = current_user.patterns.create(pattern_params)

    if @pattern.persisted?
      redirect_to request.referrer
      flash[:notice] = "New shift pattern was successfully created"
    else
      redirect_to root_path
      flash[:notice] = "Something went wrong"
    end
  end

  private

  def pattern_params
    params.require(:pattern).permit(:schedule_id, :shift_start, :shift_length, :break_length, :primary_role)
  end
end
