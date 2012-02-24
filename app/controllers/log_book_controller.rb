class LogBookController < ApplicationController
	def index
    @new_run = Run.new
		@runs =	Run.find(:all)
	end

  def new_run
    @run = Run.new(params[:run])
    @run.save
    redirect_to log_book_path 
  end
end
