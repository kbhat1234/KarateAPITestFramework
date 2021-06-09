Feature: delete user from the system uisng id using Delete rest method

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: Test case1: delete the user using Delete method
    Given path '/users/2'
    When method DELETE
    Then status 204
    Then print 'Response is ', response