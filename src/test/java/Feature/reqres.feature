Feature: feature tests for reqres.in api's

  Background: 
    * url 'https://reqres.in/api'

  Scenario: List Users
    Given path '/users'
    Given param page = 2
    When method get
    Then status 200
    Then print response
    And assert response.data.length == 6
    And assert response.page != null
    And assert response.page == 2
    And assert response.per_page == 6
    And assert response.total == 12
    And assert response.total_pages == 2
    And match $.data[2].last_name == 'Funke'

  Scenario: user not found
    Given path '/users/23'
    When method get
    Then status 404
    Then print response

  Scenario: Single user details
    Given path '/users/2'
    When method get
    Then status 200
    Then print response
    And assert response.data.email == 'janet.weaver@reqres.in'
    And assert response.data.last_name != null
    And assert response.data.first_name != null
    And match $.data.avatar == 'https://reqres.in/img/faces/2-image.jpg'
