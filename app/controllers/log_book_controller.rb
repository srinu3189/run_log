require 'exports_runs'

class LogBookController < ApplicationController
  before_filter :authenticate_runner!

  def index
    @new_run = Run.new
    @runs =	Run.find_all_and_calculate_mileage
  end

  def new_run
    @new_run = Run.new(params[:run])
    if @new_run.save
      flash[:notice] = 'Run logged successfully!'
    else
      flash[:alert] = render_to_string(:partial => 'bulleted_flash_alerts',
                                      :object => @new_run.errors.full_messages ) 
    end
    redirect_to log_book_path
  end

  def destroy_run
    @run = Run.find(params[:id])
    @run.destroy
    redirect_to log_book_path
  end

  def export
    @runs =	Run.find_all_and_calculate_mileage
    csv_string = ExportsRuns.to_csv(@runs)
    send_data csv_string, 
      :type => 'text/csv; charset=iso-8859-1; header=present', 
      :disposition => "attachment; filename=run_log.csv" 
  end
end
