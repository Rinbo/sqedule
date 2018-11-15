class PatternsController < ApplicationController
  include SchedulesHelper

  def new
    @pattern = current_user.patterns.new
  end

  def create
    @pattern = current_user.patterns.create(pattern_params)

    if @pattern.persisted?
      redirect_to root_path
      flash[:notice] = "New shift pattern was successfully created"
    else
      redirect_to root_path
      flash[:notice] = "Something went wrong"
    end
  end

  def edit
    @pattern = Pattern.find(params[:id])
  end
  
  def update
    @pattern = Pattern.find(params[:id])
      if @pattern.update_attributes(pattern_params)
        flash[:notice] = "Shift pattern was successfully updated"
        redirect_to root_path
      else
        flash[:notice] = @pattern.errors.messages
        redirect_to root_path
      end
  end
  

  def destroy
    @pattern = Pattern.find(params[:id])
    if @pattern.destroy
      redirect_to root_path
      flash[:notice] = "Shift pattern was successfully deleted."
    else
      render 'show'
      flash[:notice] = "Something went wrong. Pattern was not deleted."
    end
  end

  private

  def pattern_params
    params.require(:pattern).permit(:schedule_id, :shift_start, :shift_end, :break_length, :primary_role)
  end
end
