Feature: Add a run entry

	So that I can review a list of runs
	As a runner
	I want to create a run for a specific date

	Scenario: Create a run for today 
		Given I am on the logbook page 
		When I create a run of 17 miles in 1:10:03 with a description of "Rolling like a boss" for today
		Then a run should exist for today of 17 miles, with a time of 4203, and a description of "Rolling like a boss"

	Scenario: Create a run for yesterday 
