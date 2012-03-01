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
end
