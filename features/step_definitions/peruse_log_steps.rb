Given /^a run of (\d+) miles$/ do |miles|
	Run.create!(:date => Date.today, :miles => miles)
end

Given /^a run of (\d+) seconds$/ do |seconds|
	Run.create!(:date => Date.today, :miles => 1, :time => seconds)
end

Given /^a run with a description of "([^"]*)"$/ do |desc|
	Run.create!(:date => Date.today, :miles => 1, :description => desc)
end

Given /^a run for today$/ do
	Run.create!(:miles => 1, :date => Date.today)
end

Given /^runs over the past two weeks$/ do
	Run.create!(:miles => 1, :date => Date.today)
	Run.create!(:miles => 2, :date => Date.today - 5.days)
	Run.create!(:miles => 4, :date => Date.today - 2.days)
	Run.create!(:miles => 8, :date => Date.today - 6.days)
	Run.create!(:miles => 16, :date => Date.today - 7.days)
	Run.create!(:miles => 32, :date => Date.today - 8.days)
	Run.create!(:miles => 64, :date => Date.today - 12.days)
end

When /^I visit the logbook$/ do
	visit log_book_path
end

Then /^I should see a run with (\d+) miles$/ do |miles|
	page.should have_content(miles)
end

Then /^I should see a run with a time of (\d+):(\d+):(\d+)$/ do |hours, minutes, seconds|
	page.should have_content(hours + ':' + minutes + ':' + seconds)
end

Then /^I should see a run with a description of "([^"]*)"$/ do |desc|
	page.should have_content(desc)
end

Then /^I should see a run with today's date$/ do
	page.should have_content(Date.today.strftime('%B %-d, %Y'))
end

Then /^the runs should be ordered chronologically$/ do
  page.body.should =~ /run_3.*run_2/m
end

Then /^each run should display the rolling MPW for that date$/ do
  within('#run_1') do |content|
    page.should have_content('15')
  end
end
