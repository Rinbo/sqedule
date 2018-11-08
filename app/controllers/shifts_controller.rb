class ShiftsController < ApplicationController
  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    binding.pry
    @shift = @schedule.pattern.shifts.create(shift_params)
    if @shift.persisted?
      redirect_to @schedule
      flash[:notice] = "New schedule successfully created"
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
