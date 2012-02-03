class LogBookController < ApplicationController
	def index
		@runs =	Run.find(:all)
	end
end
