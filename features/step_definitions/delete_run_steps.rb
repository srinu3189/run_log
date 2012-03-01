Given /^two runs for today$/ do
  Run.create!(:date => Date.today, :miles => 1)
  Run.create!(:date => Date.today, :miles => 2)
end

When /^delete the first run$/ do
  within('#run_1') do
    click_link "Destroy"
  end
end

Then /^I should see the second run in the log$/ do
  page.should have_selector('#run_2') 
end

Then /^I should not see the first run in the log$/ do
  page.should_not have_selector('#run_1') 
end
