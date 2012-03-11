Feature: Delete a run entry

	So that I can update a list of runs
	As a runner
	I want to delete a specific run from the log

	Background:
		Given I am logged in

	Scenario: Delete a run
		Given two runs for today
		When I visit the logbook
		And delete the first run
		Then I should see the second run in the log
		But I should not see the first run in the log
