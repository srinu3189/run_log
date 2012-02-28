class LogBookController < ApplicationController
  def index
    @new_run = Run.new
    @runs =	Run.find(:all, :order => "date desc")
  end

  def new_run
    @run = Run.new(params[:run])
    @run.save
    redirect_to log_book_path 
  end

  def destroy_run
    @post = Run.find(params[:id])
    @post.destroy
    redirect_to log_book_path
  end
end
