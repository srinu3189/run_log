Feature: Peruse Log

	So that I can see my progress 
	As a runner
	I want to peruse my running log

	Scenario: Run entries display miles
		Given a run of 11 miles
		When I visit the logbook
		Then I should see a run with 11 miles		

	Scenario: Run entries display time
		Given a run of 4217 seconds
		When I visit the logbook
		Then I should see a run with a time of 1:10:17		

	Scenario: Run entries display description
	Scenario: Run entries display rolling miles per week
	Scenario: Run entries are ordered cronologically descending
	Scenario: Log displays only last year of runs
