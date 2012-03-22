module CalculatesMileage
  def self.calculate_rolling_mpw_for_runs(runs)
    runs.each do |run| 
        run.mpw = runs.find_all { |r| run.date >= r.date && run.date - 7.days < r.date }
        .inject(0) { |sum, s| sum + s.miles }
    end 
  end

  def self.calculate_yearly_mpw_series_for_runs(runs)
    yearly_series = {}
    runs.each do |run|
      yearly_series[run.date.year] = Array.new(53, 0) unless yearly_series.has_key?(run.date.year)
      yearly_series[run.date.year][run.date.cweek] += run.miles
    end
    yearly_series
  end
end
