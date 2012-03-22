require_relative "../lib/calculates_mileage"

describe CalculatesMileage do
  describe "#calculate_rolling_mpw_for_runs" do
    it "includes the miles for the run" do
      run_1 = Run.new(:date => Date.parse('2010-03-14'), :miles => 1)
      CalculatesMileage.calculate_rolling_mpw_for_runs([run_1])
      run_1.mpw.should == 1
    end 

    it "includes all miles run on the day of the run" do
      run_1 = Run.new(:date => Date.parse('2010-03-14'), :miles => 1)
      run_2 = Run.new(:date => Date.parse('2010-03-14'), :miles => 2)
      CalculatesMileage.calculate_rolling_mpw_for_runs([run_1, run_2])
      run_1.mpw.should == 3 
    end 

    it "includes miles run in the 6 days prior" do
      run_1 = Run.new(:date => Date.parse('2010-03-14'), :miles => 1)
      run_2 = Run.new(:date => Date.parse('2010-03-08'), :miles => 4)
      CalculatesMileage.calculate_rolling_mpw_for_runs([run_1, run_2])
      run_1.mpw.should == 5 
    end 

    it "does not include miles run beyond 6 days prior" do
      run_1 = Run.new(:date => Date.parse('2010-03-14'), :miles => 1)
      run_2 = Run.new(:date => Date.parse('2010-03-07'), :miles => 4)
      CalculatesMileage.calculate_rolling_mpw_for_runs([run_1, run_2])
      run_1.mpw.should == 1 
    end 

    it "does not include newer runs" do 
      run_1 = Run.new(:date => Date.parse('2010-03-14'), :miles => 1)
      run_2 = Run.new(:date => Date.parse('2010-03-15'), :miles => 4)
      CalculatesMileage.calculate_rolling_mpw_for_runs([run_1, run_2])
      run_1.mpw.should == 1 
    end 
  end

  describe "#calculate_rolling_mpw_for_runs" do
    before (:each) do
      run_1 = Run.new(:date => Date.parse('2010-03-16'), :miles => 1)
      run_2 = Run.new(:date => Date.parse('2010-03-17'), :miles => 4)
      run_3 = Run.new(:date => Date.parse('2011-03-15'), :miles => 7)
      @yearly_series = CalculatesMileage.calculate_yearly_mpw_series_for_runs([run_1, run_2, run_3])
    end

    it "returns a hash with a key per year of mileage" do
      @yearly_series.should have_key(2010)
      @yearly_series.should have_key(2011)
    end  

    it "returns a hash where the value array contains one entry per week of the year" do
      @yearly_series[2010].count.should == 53
    end

    it "returns a hash where the value arrays elements represent the mpw for that week of the year" do
      @yearly_series[2010][0].should == 0
      @yearly_series[2010][11].should == 5 
    end
  end
end
