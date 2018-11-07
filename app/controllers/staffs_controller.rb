class StaffsController < ApplicationController

  def create
    @staff = Staff.create(staff_params)
    if @staff.persisted?
      redirect_to request.referrer
      flash[:notice] = "New staff member was successfully created"
    else
      render redirect_to root_path
      flash[:notice] = "Something went wrong"
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :shift_preference, :cleaning, :employment_end)
  end

end
