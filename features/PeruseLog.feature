Feature: Peruse Log

	So that I can see my progress 
	As a runner
	I want to peruse my running log

	Background:
		Given I am logged in

	Scenario: Run entries display date
		Given a run for today
		When I visit the logbook
		Then I should see a run with today's date	

	Scenario: Run entries display miles
		Given a run of 11 miles
		When I visit the logbook
		Then I should see a run with 11 miles		

	Scenario: Run entries display time
		Given a run of 4217 seconds
		When I visit the logbook
		Then I should see a run with a time of 1:10:17		

	Scenario: Run entries display description
		Given a run with a description of "smashing run!!" 
		When I visit the logbook
		Then I should see a run with a description of "smashing run!!"		

	Scenario: Run entries are ordered chronologically descending
		Given runs over the past two weeks 
		When I visit the logbook
		Then the runs should be ordered chronologically

	Scenario: Run entries display rolling miles per week
		Given runs over the past two weeks
		When I visit the logbook
		Then each run should display the rolling MPW for that date
