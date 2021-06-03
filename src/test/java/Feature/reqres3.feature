Feature: Delete user from system using DELETE method

  Background: 
    * url 'https://reqres.in/api'

  Scenario: Delete user
    Given path '/users/2'
    When method delete
    Then status 204
    And print response