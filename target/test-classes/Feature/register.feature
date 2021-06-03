Feature: Register user using /register

  Background: 
    * url 'https://reqres.in/api'

  Scenario: Register the user with email and password
    Given path '/register'
    When request {"email": "eve.holt@reqres.in", "password": "pistol"}
    And method post
    Then status 200
    Then print response
    And assert response.id != null
    And match response.id == '#number'
    And match response.token == '#string'
    And match response.token != '#number'

  Scenario: Register user with only email
    Given path '/register'
    When request {"email": "eve.holt@reqres.in"}
    And method post
    Then status 400
    Then print response
    And match $.error == 'Missing password'
    And assert response.error == 'Missing password'

  Scenario: Register user with only password
    Given path '/register'
    When request {"password": "eve.holt@reqres.in"}
    And method post
    Then status 400
    Then print response
    And match $.error == 'Missing email or username'
    And assert response.error == 'Missing email or username'