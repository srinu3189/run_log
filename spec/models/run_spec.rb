describe Run do
	describe '#run_time' do
		run = Run.create!(:time => 4222)
		run.run_time.should == "01:10:22"	
	end
end
