require 'calculates_mileage'

class Run < ActiveRecord::Base
  attr_accessor :mpw

  def self.find_all_and_calculate_mileage
    runs =	self.find(:all, :order => "date desc")
    CalculatesMileage.calculate_rolling_mpw_for_runs(runs) if runs
    runs
  end

  def run_time
    return '' if self.time == nil
    seconds = self.time.to_i
    [self.time/3600, self.time/60 % 60, self.time % 60].map{|t| t.to_s.rjust(2,'0')}.join(':')
  end

  def hours=(numHours)
    self.time ||= 0
    self.time += numHours.to_i * 60 * 60
  end

  def minutes=(numMinutes)
    self.time ||= 0
    self.time += numMinutes.to_i * 60
  end

  def seconds=(numSeconds)
    self.time ||= 0
    self.time += numSeconds.to_i
  end
end
