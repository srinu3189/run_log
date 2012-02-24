Given /^a run of (\d+) miles$/ do |miles|
	Run.create!(:miles => miles)
end

Given /^a run of (\d+) seconds$/ do |seconds|
	Run.create!(:time => seconds)
end

Given /^a run with a description of "([^"]*)"$/ do |desc|
	Run.create!(:description => desc)
end

Given /^I am on the logbook page$/ do
	visit log_book_path
end

When /^I visit the logbook$/ do
	visit log_book_path
end

When /^I create a run of (\d+) miles in (\d+):(\d+):(\d+) with a description of "([^"]*)" for today$/ do |miles, hours, minutes, seconds, desc|
  fill_in "miles", :with => miles
  fill_in "description", :with => desc
  fill_in "hours", :with => hours
  fill_in "minutes", :with => minutes
  fill_in "seconds", :with => seconds
  click_button "Add Run"
end

Then /^a run should exist for today of (\d+) miles, with a time of (\d+), and a description of "([^"]*)"$/ do |miles, time, desc|
  run = Run.where(:miles => miles).first
  run.miles.should == miles.to_i
  run.time.should == time.to_i
  run.description.should == desc
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
