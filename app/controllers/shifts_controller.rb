class ShiftsController < ApplicationController
  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    @pattern = Pattern.find(params[:pattern_id])
    @schedule = Schedule.find(params[:schedule_id])
    @shift = @pattern.shifts.create(shift_params)
    if @shift.persisted?
      redirect_to @schedule
      flash[:notice] = "New shift was successfully created"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:date, :shift_start, :shift_length, :break_length, :cleaning)
  end
end
