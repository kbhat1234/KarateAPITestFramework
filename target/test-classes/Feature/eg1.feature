Feature: Example 1

  Background: 
    #Given url 'https://reqres.in/api'
    * url 'https://reqres.in/api'
    #And def responseEg1 = read('../data/eg1.json')
    * def responseEg1 = read('../data/eg1.json')
    
  Scenario: Test scenario 1
    Given path '/users/2'
    When method get
    Then status 200
    And assert response.data.id == 2
    And print response.data.id
    And print response
    And match response == {"data":{"id":'#number',"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    And match $.data.id == '#number'
    And match $.data.first_name == '#string'
    And match $.data.support.url == '#ignore'
    And print responseEg1
    And match response.data.id == responseEg1[1].data.id
    And match response == responseEg1[1]
    * def job_code = response.data.job_code
    And match job_code == null
    
    
    Scenario: Test scenario 2
    Given path '/users/1'
    When method get
    Then status 200
    And assert response.data.id == 1
    And print response.data.id
    And print response
    And match $.data.id == '#number'
    And match $.data.first_name == '#string'
    And match $.data.support.url == '#ignore'
    And print responseEg1
    And match response.data.id == responseEg1[0].data.id
    And match response == responseEg1[0]
    * def job_code = response.data.job_code
    And match job_code == null
    
    
    Scenario: Test scenario 3
    Given path '/users/3'
    When method get
    Then status 200
    And assert response.data.id == 3
    And print response.data.id
    And print response
    And match $.data.id == '#number'
    And match $.data.first_name == '#string'
    And match $.data.support.url == '#ignore'
    And print responseEg1
    And match response.data.id == responseEg1[2].data.id
    And match response == responseEg1[2]
    * def job_code = response.data.job_code
    And match job_code == null
