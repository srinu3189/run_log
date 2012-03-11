require_relative "../lib/exports_runs"

describe ExportsRuns do

  describe "#to_csv" do

    it "returns a title row in csv format" do
      runs = []
      csv_string = ExportsRuns.to_csv(runs)
      csv_string.should == "run_id,date,miles,time,mpw,description\n"
    end

    it "converts each run into a csv formatted row" do
      runs = []
      runs.push double("run", :id => 1, :date => '1/1/2010', :miles => '7', :time => '1:1:02', :mpw => '74', :description => 'good stuff')
      csv_string = ExportsRuns.to_csv(runs)
      csv_string.should == "run_id,date,miles,time,mpw,description\n1,1/1/2010,7,1:1:02,74,good stuff\n"
    end

  end

end
