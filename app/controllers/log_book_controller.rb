class LogBookController < ApplicationController
  def index
    @new_run = Run.new
    @runs =	Run.find_all_and_calculate_mileage
  end

  def new_run
    @new_run = Run.new(params[:run])
    @new_run.save
    @runs =	Run.find_all_and_calculate_mileage
    render :action => "index"
  end

  def destroy_run
    @run = Run.find(params[:id])
    @run.destroy
    redirect_to log_book_path
  end
end
