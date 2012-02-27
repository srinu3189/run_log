Given /^a run of (\d+) miles$/ do |miles|
	Run.create!(:miles => miles)
end

Given /^a run of (\d+) seconds$/ do |seconds|
	Run.create!(:time => seconds)
end

Given /^a run with a description of "([^"]*)"$/ do |desc|
	Run.create!(:description => desc)
end

Given /^a run for today$/ do
	Run.create!(:run_date => Date.today)
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
	page.should have_content(Date.today.to_s)
end

