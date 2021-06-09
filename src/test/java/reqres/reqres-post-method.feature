Feature: create user passing name and job

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def requestBody = read('../data/requestBodyPost.json')
    * def responseBody = read('../data/responsePost.json')
    * def requestReg = read('../data/registerRequest.json')
    * def requestReg1 = read('../data/registerRegisterUnsuccess.json')

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

  Scenario: Test case2: Register the user with email and password -Successful
    Given path '/register'
    When request requestReg
    Then method POST
    And status 200
    Then match response == {"id": '#ignore',"token": "#string"}
    Then print 'Response is ', response

  Scenario: Test case3: Register the user with email - Unsuccessful
    Given path '/register'
    When request requestReg1
    Then method POST
    And status 400
    Then match response == {"error": "Missing password"}
    Then print 'Response is ', response
    Then match response.error == 'Missing password'

  Scenario: Test case4: Register the user with password - Unsuccessful
    Given path '/register'
    When request {"password": "abcd1234"}
    Then method POST
    And status 400
    Then match response == {"error": "Missing email or username"}
    Then print 'Response is ', response
    Then match response.error == 'Missing email or username'

  Scenario: Test case5: login with valid email and password - Successful
    Given path '/login'
    When request requestReg
    Then method POST
    And status 200
    Then match response == {"token": "#ignore"}
    Then print 'Response is ', response

    
    Scenario: Test case5: login with email and no password - Unsuccessful
    Given path '/login'
    When request {"email": "karthik@deem.com"}
    Then method POST
    And status 400
    Then match response == {"error": "Missing password"}
    Then match response.error == 'Missing password'
    Then print 'Response is ', response
    
    Scenario: Test case5: login with password and no email - Unsuccessful
    Given path '/login'
    When request {"password": "abcd1234"}
    Then method POST
    And status 400
    Then match response == {"error":"Missing email or username"}
    Then match response.error == 'Missing email or username'
    Then print 'Response is ', response
    