Feature: API to create a user

  Background: 
    * url 'https://reqres.in/api'
    * def testName = 'karthik'

  Scenario: Create new user
    Given path '/users'
    When request {"name":'#(testName)', "Job": "test"}
    And method post
    Then status 201
    Then print response
    Then print responseStatus
    Then print responseCookies
    Then print responseBytes
    Then print responseHeaders
    Then print responseTime
    Then print responseType
    #Then print responseTimeStamp
    And match response == {"name": '#(testName)', "Job": "test", "id": '#ignore', "createdAt": '#notnull'}
    And assert response.name != null
    And match $.id != null
    And match $.Job == 'test'
