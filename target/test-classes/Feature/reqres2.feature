Feature: Updating user information

  Background: 
    * url 'https://reqres.in/api'
    * def createdUser = call read('reqres1.feature')

  Scenario: Updating the user info using put method
    Given path '/users/2'
    When request {"name": '#(createdUser.response.name)', "job": "spy"}
    And method put
    Then status 200
    Then print response.name
    Then print response.job
    And match response == {"name": '#(createdUser.response.name)', "job": "spy", "updatedAt": '#notnull'}

  Scenario: update the user info using patch method
    Given path '/users/1'
    When request {"name": "morpheus", "job": "software engineer"}
    And method patch
    Then status 200
    Then print response
    And assert response.job == 'software engineer'

  Scenario: get all users with delayed response by 3 seconds
    Given path '/users'
    And param delay = 3
    And method get
    Then status 200
    Then print response
    And assert response.data.length == 6