puts 'Setting up First Runner'
runner = Runner.create! :email => 'charlesriley1@gmail.com', :password => 'trialofmiles', :password_confirmation => 'trialofmiles'
puts 'Runner created: ' << runner.email
