Feature: create user passing name and job

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestBody = read('../data/requestBodyPost.json')
    * def responseBody = read('../data/responsePost.json')

  Scenario: Test case1: create user using POST api
    Given path '/users'
    When request requestBody
    Then print 'Request body is ', requestBody
    And method POST
    Then status 201
    Then print 'Response is ', response
    And match response == responseBody
    Then match response.id != '#number'
    And match response.name == '#string'
    And match response.name == responseBody.name
    And match response.id == responseBody.id
    And match response.job == responseBody.job
    And match response.createdAt == responseBody.createdAt
    And match response.name == '#string'
    And match response.job == '#string'
    
    
    
