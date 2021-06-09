Feature: This is a get call used to get list of users

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedResponse = read('../data/listUsersResponse.json')
    * def expectedResponsePage = read('../data/listUsersResponsePage.json')
    * def expectedUserOneResponse = read('../data/user1Response.json')
    * def expectedUserTwoResponse = read('../data/user2Response.json')
    * def expectedListResource = read('../data/listResource.json')
    * def expectedSingleUserResource = read('../data/singleUserResource.json')

  Scenario: Test case1: get list of users
    Given path '/users'
    And param page = 2
    Then print expectedResponse
    When method GET
    Then status 200
    And print '--response is--', response
    And print 'first name is --', response.data[3].first_name
    And match response == expectedResponse
    And match response.page == 2
    And assert response.data.length == 6
    And assert response.data[3].first_name == 'Byron'
    And match $.support.text == 'To keep ReqRes free, contributions towards server costs are appreciated!'
    And match $.page == '#number'
    And match $.data[3].id == '#number'
    And match $.data[3].email == '#string'
    And match $.data[1].last_name != '#number'

   
   Scenario: Test case2: invalid page value page=-1
   Given path '/users'
   And param page = -1
   When method GET
   Then status 200
   And print 'Response is ', response
   And match response == expectedResponsePage
   And print 'Response when invalid page value provided is --', expectedResponsePage
   
   
   Scenario: Test case3: invalid end point url 'https://reqres.in/apiv1/users?page=2'
   Given url 'https://reqres.in/apiv1'
   And path '/users'
   And param page = 2
   When method GET
   Then status 404
   And print '--response when invalid end point url is --', response
   
   
   Scenario: Test case4: get user details of particular user - /users/2
   Given path '/users/2'
   When method GET
   Then status 200
   And print 'response of user details is ', response
   Then match response == expectedUserTwoResponse
   Then assert response.data.first_name == expectedUserTwoResponse.data.first_name
   And print 'first_name from response is ', response.data.first_name
   And print 'first_name from expected response is ', expectedUserTwoResponse.data.first_name
   
   
   Scenario: Test case5: get user details of particular user - /users/1
   Given path '/users/1'
   When method GET
   Then status 200
   And print 'Response of user details is ', response
   Then match response == expectedUserOneResponse
   Then assert response.data.first_name == expectedUserOneResponse.data.first_name
   And print 'first_name from response is ', response.data.first_name
   And print 'first_name from expected response is ', expectedUserOneResponse.data.first_name
   
   
   Scenario: Test case6: invalid user details - /users/24
   Given path '/users/27'
   When method GET
   Then status 404
   And print 'Response is ', response
   Then match response == {}
   
   
   Scenario: Test case7: get user details in delay of 3 seconds
   Given path '/users'
   And param delay = 3
   When method GET
   Then status 200
   And print 'Response is ', response
   Then match $.support.url == 'https://reqres.in/#support-heading'
   Then print 'Support url is ', response.support.url
   
   
   Scenario: Test case8: get user details using list resource
   Given path '/unknown'
   When method GET
   Then status 200
   And print 'Response is ', response
   Then match response == expectedListResource
   Then print 'expectedListResource is ', expectedListResource
   Then match response.data[3].name == expectedListResource.data[3].name
   Then print 'Actual Response is ', response.data[3].name
   Then print 'Expected response is ', expectedListResource.data[3].name
   
   
   Scenario: Test case9: get single user details using list resource
   Given path '/unknown/2'
   When method GET
   Then status 200
   And print 'Response is ', response
   Then match response == expectedSingleUserResource
   Then print 'expectedSingleUserResource is ', expectedSingleUserResource
   Then match response.data.color == expectedSingleUserResource.data.color
   Then print 'Actual Response is ', response.data.color
   Then print 'Expected response is ', expectedSingleUserResource.data.color
   Then match response.data.color == '#string'
   
   
   Scenario: Test case10: get single user details not found using list resource
   Given path '/unknown/23'
   When method GET
   Then status 404
   And print 'Response is ', response
   Then match response == {}