Feature: Example 1

  Background: 
    #Given url 'https://reqres.in/api'
    * url 'https://reqres.in/api'
    #And def responseEg1 = read('eg1.json')
    * def responseEg1 = read('eg1.json')
    
  Scenario: Test case 1 of example 1
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
    And match response.data.id == responseEg1.data.id
    And match response == responseEg1
    * def job_code = response.data.job_code
    And match job_code == null
    
