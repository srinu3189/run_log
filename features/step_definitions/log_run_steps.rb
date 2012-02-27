require 'timecop'

Given /^I am on the logbook page$/ do
  visit log_book_path
  static_date = Time.local(2010, 3, 17, 5, 0, 0)
  Timecop.freeze(static_date)
end

When /^I log a run for today$/ do
  fill_in "run_miles", :with => 17
  fill_in "run_description", :with => "Like a boss!"
  fill_in "run_hours", :with => "1" 
  fill_in "run_minutes", :with => "10"
  fill_in "run_seconds", :with => "03"
  click_button "Add Run"
end

Then /^I should see today's run in the log$/ do 
  page.should have_content('17');
  page.should have_content('Like a boss!');
  page.should have_content('1:10:03');
end

When /^I log a run for yesterday$/ do
  select_date "Date", :with => "16 Mar 2010"
  fill_in "run_miles", :with => 8 
  fill_in "run_description", :with => "The trials were expecially tough today."
  fill_in "run_hours", :with => "1" 
  fill_in "run_minutes", :with => "18"
  fill_in "run_seconds", :with => "22"
  click_button "Add Run"
end

Then /^I should see yesterday's run in the log$/ do
  page.should have_content('8');
  page.should have_content('2010-03-16');
end

After do
  Timecop.return
end
