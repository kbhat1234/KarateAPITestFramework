Feature: Reading the post request body from JSON file

  Background: 
    * url 'https://reqres.in/api'
    * def requestBody = read('../data/feature1-request.json')
    * def expectedResponse = read('../data/feature1-response.json')
    * header Accept = 'application/json'
    * header User-Agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101 Firefox/89.0'
    #* def projectPath = karate.properties['user.dir']
    #* def filePath = projectPath+'\\src\\main\\resources\\feature1-request.json'

  Scenario: test to read request from json file
    Given path '/users'
    When request requestBody
    And set requestBody.job = 'engineer'
    And set requestBody.name = 'kaustubh'
    And method post
    Then status 201
    Then print response
    #And match response == expectedResponse
    And match $.name == 'kaustubh'
    And match $.job == 'engineer'
    #Then print expectedResponse
    #Then print requestBody
    #Then print projectPath
    #Then print filePath