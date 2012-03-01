module CalculatesMileage
  def self.calculate_rolling_mpw_for_runs(runs)
    runs.each do |run| 
        run.mpw = runs.find_all { |r| run.date >= r.date && run.date - 7.days < r.date }
        .inject(0) { |sum, s| sum + s.miles }
    end 
  end
end
