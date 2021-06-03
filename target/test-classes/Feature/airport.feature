Feature: Airport get api

  Background: 
    * url 'https://airport-info.p.rapidapi.com'
    * header x-rapidapi-key = '5b4ec3eb08msh114414b98b9add5p1671adjsnd9a147b95391'
    * header x-rapidapi-host = 'airport-info.p.rapidapi.com'
    * header useQueryString = 'true'

  Scenario: Lookup an airport by its IATA or ICAO code
    Given path '/airport'
    #And param icao = 'PA'
    And param iata = 'QR'
    When method get
    Then status 200
    Then print response
