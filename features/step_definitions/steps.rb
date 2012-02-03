
Given /^a run of (\d+) miles$/ do |miles|
	Run.create!(:miles => miles)
end

When /^I visit the logbook$/ do
end

Then /^I should see a run with (\d+) miles$/ do |arg1|
	visit '/log_book'
	page.should have_content("11")
end
