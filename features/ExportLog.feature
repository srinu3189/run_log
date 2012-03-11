Feature: Export the log

	So that I can backup my log
	As a runner
	I want to export my log to CSV

	Background: 
		Given I am logged in

	Scenario: Export the log
		Given some runs 
		And I am on the logbook page 
		When I export my log
		Then I should be provided a CSV File containing my runs 
