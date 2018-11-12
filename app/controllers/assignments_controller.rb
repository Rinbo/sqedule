class AssignmentsController < ApplicationController

  def new
    @assignment = Assignment.new
    @date = params[:date].to_date
    @shifts = Shift.where(date: @date)
  end

  def create
    @staff = Staff.find(params[:staff_id])
    @shifts = Shift.where(date: @date)
    @assignment = @staff.assignments.create(assignment_params)
    if @assignment.persisted?
      redirect_to root_path
      flash[:notice] = "New assignment was successfully created"
    else
      render :new
      flash[:notice] = "Something went wrong"
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])    
    @date = params[:date].to_date
    @shifts = Shift.where(date: @date)
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      redirect_to root_path
      flash[:notice] = "Assignment was successfully updated."
    else
      render 'edit'
    end
  end
  
  private

  def assignment_params
    params.require(:assignment).permit(:date, :off, :shift, :locked_shift_id)
  end
end
