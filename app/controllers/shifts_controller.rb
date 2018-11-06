class ShiftsController < ApplicationController
  def show
    @shift = Shift.new(params[:id])
  end
end
