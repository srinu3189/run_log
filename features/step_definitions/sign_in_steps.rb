Given /^I am logged in$/ do
  FactoryGirl.create(:runner)
  visit new_runner_session_path
  fill_in "runner_email", :with => 'frank@example.com'
  fill_in "runner_password", :with => 'shorter'
  click_button "Sign in"
end
