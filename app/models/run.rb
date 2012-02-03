class Run < ActiveRecord::Base
	def run_time
		return '' if self.time == nil
		seconds = self.time.to_i
		[time/3600, time/60 % 60, time % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
	end
end
