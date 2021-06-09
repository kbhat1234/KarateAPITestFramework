Feature: Update user details - partial update of user using patch method

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestBody = read('../data/requestBodyPost.json')

  Scenario: Test case1: update the partial user details
    Given path '/users/2'
    Then request requestBody
    And set requestBody.job = 'Senior Engineer'
    When method PATCH
    Then status 200
    And print 'Actual Response is ', response
    Then match response == {"name": "morpheus","job": "Senior Engineer","updatedAt": "#ignore"}
    Then match response.name == 'morpheus'
    Then match response.name == '#string'
    Then match response.job == 'Senior Engineer'
    Then match response.job == '#string'
    Then match response.updatedAt == '#ignore'
