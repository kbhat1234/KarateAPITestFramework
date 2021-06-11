Feature: Test the variables both local and global

  Background: 
   # global declartions, these variables can be accessed by any scenarios
    * def fname = 'karthik '
    * def lname = 'bhat'
    * def fullname = fname + lname

  Scenario: Test1
    Then print 'Full name is ', fullname
    * def val1 = 10
    * def val2 = 5
    * def sum = val1 + val2
    Then print 'val1 is ', val1
    Then print 'val2 is ', val2
    Then print 'sum is ', sum

  Scenario: Test2
    Then print fullname
		* def val1 = 5
		* def val2 = 5
		* def sum = val1 + val2
		Then print 'val1 is ', val1
		Then print 'val2 is ', val2
		Then print 'sum is ', sum
		
		Then print val1
		Then print val2
		