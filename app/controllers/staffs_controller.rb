class StaffsController < ApplicationController

  def new
    @staff = current_user.staffs.new
  end

  def create
    @staff = current_user.staffs.create(staff_params)
    if @staff.persisted?
      redirect_to root_path
      flash[:notice] = "New staff member was successfully created"
    else
      redirect_to root_path
      flash[:notice] = "Something went wrong"
    end
  end

  def edit
    @staff = Staff.find(params[:id])
  end
  
  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_params)
      flash[:notice] = "Staff member was successfully edited"
      redirect_to root_path
    else
      flash[:notice] = @staff.errors.messages
      redirect_to root_path
    end
  end
  

  def destroy
    @staff = Staff.find(params[:id])
    if @staff.destroy
      redirect_to root_path
      flash[:notice] = "Staff was successfully deleted."
    else
      render 'show'
      flash[:notice] = "Something went wrong. Staff was not deleted."
    end
  end

  private

  def staff_params
    params.require(:staff).permit(:name, :shift_preference, :primary_role, :employment_end, :roles)
  end

end
