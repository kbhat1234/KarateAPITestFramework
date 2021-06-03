Feature: Login user with email and password

  Background: 
    * url 'https://reqres.in/api'

  Scenario: login successful test
    Given path '/login'
    When request {"email": "eve.holt@reqres.in", "password": "cityslicka"}
    And method post
    Then status 200
    Then print response
    And match $.token == '#notnull'

  Scenario: login unsuccessful test
    Given path '/login'
    When request {"email": "eve.holt@reqres.in"}
    And method post
    Then status 400
    Then print response
    And match $.error == 'Missing password'
