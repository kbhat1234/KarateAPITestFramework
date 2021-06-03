Feature: check returned countries by api

  Background: 
    * url 'https://restcountries.eu'
    * header Accept = 'application/json'
    * def resp = read('../data/country.json')

  Scenario: get list of all countries
    Given path '/rest/v2/all'
    When method get
    Then status 200
    Then print response
    Then print responseStatus
    Then print responseCookies
    Then print responseBytes
    Then print responseHeaders
    Then print responseTime
    Then print responseType

  #Then print responseTimeStamp
  Scenario: Search by country name by - native name
    Given path '/rest/v2/name/eesti'
    When method get
    Then status 200
    Then print response
    And match response == resp

  Scenario: Search by country name by - partial name
    Given path '/rest/v2/name/united'
    When method get
    Then status 200
    Then print response

  Scenario: Search by country full name
    Given path '/rest/v2/name/aruba'
    Given param fullText = 'true'
    When method get
    Then status 200
    Then print response

  Scenario: Search by 2 letter code
    Given path '/rest/v2/alpha/co'
    When method get
    Then status 200
    Then print response

  Scenario: Search by 3 letter code
    Given path '/rest/v2/alpha/col'
    When method get
    Then status 200
    Then print response
    And match response.subregion != null
    And match response.currencies[0].name == 'Colombian peso'
    And assert response.borders[0] == 'BRA'
    #$ is same as response
    And match $.languages[0].nativeName != null

  Scenario: You can filter the output of your request to include only the specified fields.
    Given path '/rest/v2/all'
    Given param field = 'name';'capital';'currencies';
    When method get
    Then status 200
    Then print response
