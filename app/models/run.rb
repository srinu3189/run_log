require 'calculates_mileage'

class Run < ActiveRecord::Base
  validates :date, :presence => true
  validates :miles, :presence => true, :numericality => true

  attr_accessor :mpw
  attr_accessor :hours
  attr_accessor :minutes
  attr_accessor :seconds

  def self.find_all_and_calculate_mileage
    runs =	self.find(:all, :order => "date desc")
    CalculatesMileage.calculate_rolling_mpw_for_runs(runs) if runs
    runs
  end

  def run_time
    return '' if self.time == nil
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
