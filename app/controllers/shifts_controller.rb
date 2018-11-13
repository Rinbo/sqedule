class ShiftsController < ApplicationController
  def show
    @shift = Shift.find(params[:id])
  end

  def new
    @shift = Shift.new
  end

  def create
    @pattern = Pattern.find(params[:pattern_id])
    @shift = @pattern.shifts.create(shift_params)
    if @shift.persisted?
      redirect_to request.referrer
      flash[:notice] = "New shift was successfully created"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      redirect_to root_path
      flash[:notice] = "Shift was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    if @shift.destroy
      redirect_to root_path
      flash[:notice] = "Shift was successfully deleted."
    else
      render 'show'
      flash[:notice] = "Something went wrong. Shift was not deleted."
    end
  end
  

  private

  def shift_params
    params.require(:shift).permit(:date, :staff_req, :shift_start, :shift_length, :break_length, :cleaning)
  end
end
