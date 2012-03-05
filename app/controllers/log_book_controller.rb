require 'csv'

class LogBookController < ApplicationController
  def index
    @new_run = Run.new
    @runs =	Run.find_all_and_calculate_mileage
  end

  def new_run
    @new_run = Run.new(params[:run])
    if @new_run.save
      flash[:notice] = 'Run logged successfully!'
    else
      @alert_messages = @new_run.errors.full_messages
      flash[:alert] = render_to_string(:partial => 'bulleted_flash_alerts') 
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
    csv_string = CSV.generate do |csv| 
      csv << ["run_id", "date", "miles", "time", "mpw", "description"]
      @runs.each do |run|
        csv << [run.id, run.date, run.miles, run.time, run.mpw, run.description]
      end
    end
    send_data csv_string, 
      :type => 'text/csv; charset=iso-8859-1; header=present', 
      :disposition => "attachment; filename=run_log.csv" 
  end
end
