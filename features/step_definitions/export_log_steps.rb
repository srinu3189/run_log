Given /^some runs$/ do
  Run.create(:miles => 13, :date => Date.today, :description => "a swell run")
  Run.create(:miles => 7, :date => Date.today - 7.days, :description => "like lightning")
  Run.create(:miles => 10, :date => Date.today - 10.days, :description => "sluggish")
end

When /^I export my log$/ do
  click_link "Export Log"
end

Then /^I should be provided a CSV File containing my runs$/ do
  page.response_headers['Content-Type'].should =~ /csv/
end
