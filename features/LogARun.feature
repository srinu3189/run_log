Feature: Log a Run

	So that I can review a list of runs
	As a runner
	I want to log a run for a specific date

	Scenario: Log a run for today 
		Given I am on the logbook page 
		When I log a run for today 
		Then I should see today's run in the log

	Scenario: Log a run for yesterday 
		Given I am on the logbook page 
		When I log a run for yesterday 
		Then I should see yesterday's run in the log
		
	Scenario: I forgot to enter the miles 
		Given I am on the logbook page 
		When I log a run without entering miles 
		Then I should see a message that "Miles can't be blank"
