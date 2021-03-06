require 'spec_helper'

describe LogBookController do
  before (:each) do
    @runner = FactoryGirl.create(:runner)
    sign_in @runner
  end

  describe "#index" do
    it "returns the list of runs" do
      run = mock_model(Run, :date => Date.today, :miles => 4);
      Run.should_receive(:find_all_and_calculate_mileage).and_return([run])
      get 'index' 
      assigns[:runs].should == [run]
    end
    
    it "returns a collection of yearly mileage data" do
      yearly_hashes = []
      run = mock_model(Run);
      Run.should_receive(:find_all_and_calculate_mileage).and_return([run])
      CalculatesMileage.should_receive(:calculate_yearly_mpw_series_for_runs).with([run]).and_return(yearly_hashes)
      get 'index' 
      assigns[:yearly_mpw_series].should == yearly_hashes
    end
  end	

  describe "#new_run" do
    it "saves a run" do
      run = mock_model(Run)
      Run.should_receive(:new).and_return(run)
      run.should_receive(:save)
      post 'new_run', :run => { :date => Date.today, :miles => 15 } 
    end
  end

  describe "#destroy_run" do
    it "destroys a run" do
      run = mock_model(Run)
      Run.should_receive(:find).with('9').and_return(run)
      run.should_receive(:destroy)
      delete 'destroy_run', :id => 9
    end
  end

  describe "#export" do
    it "should find all runs and convert them to csv" do
      runs = []
      Run.should_receive(:find_all_and_calculate_mileage).and_return(runs)
      ExportsRuns.should_receive(:to_csv).with(runs)
      get 'export'
    end
  end
end
