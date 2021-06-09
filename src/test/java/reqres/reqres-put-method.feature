Feature: Update user details using update rest api call

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestBody = read('../data/requestBodyPost.json')
    * def expectedResponseBody = read('../data/responsePut.json')

  Scenario: Test case1: update the user details name and job using put method
    Given path '/users/2'
    When request requestBody
    Then set requestBody.name = 'Karthik Bhat'
    And set requestBody.job = 'QA Engineer'
    Then method PUT
    And status 200
    Then print 'Actual response is ', response
    Then print 'Expected response is ', expectedResponseBody
    Then match response == expectedResponseBody
    
    Then match response.name == 'Karthik Bhat'
    Then match response.name == expectedResponseBody.name
    Then match response.name == '#string'
    
    Then match response.job == 'QA Engineer'
    Then match response.job == expectedResponseBody.job
    Then match response.job == '#string'