Given /^I am on the logbook page$/ do
	visit log_book_path
end

When /^I log a run for today$/ do
  fill_in "miles", :with => 17
  fill_in "description", :with => "Like a boss!"
  fill_in "hours", :with => "1" 
  fill_in "minutes", :with => "10"
  fill_in "seconds", :with => "03"
  click_button "Add Run"
end

Then /^I should see today's run in the log$/ do 
  page.should have_content('17');
  page.should have_content('Like a boss!');
  page.should have_content('1:10:03');
end
