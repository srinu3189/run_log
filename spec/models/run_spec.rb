describe Run do
  it "displays the 'run time' formatted nicely" do
    describe '#run_time' do
      run = Run.create!(:time => 4222)
      run.run_time.should == "01:10:22"	
    end
  end
  
  it "has handy assignment methods for hours, minutes, and seconds" do
    describe '#hours' do
      run = Run.new
      run.hours = 2
      run.time.should == 7200
    end

    describe '#minutes' do
      run = Run.new
      run.minutes = 2
      run.time.should == 120
    end

    describe '#seconds' do
      run = Run.new
      run.seconds = 28
      run.time.should == 28
    end
  end
end
