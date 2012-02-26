Given /^a run of (\d+) miles$/ do |miles|
	Run.create!(:miles => miles)
end

Given /^a run of (\d+) seconds$/ do |seconds|
	Run.create!(:time => seconds)
end

Given /^a run with a description of "([^"]*)"$/ do |desc|
	Run.create!(:description => desc)
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
